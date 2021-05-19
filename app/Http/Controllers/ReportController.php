<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Models\DetailsSale;
use App\Models\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ReportController extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function reportGeneral(Request $request) {
        
        $date = Carbon::now();
        $total_clients = Client::all()->where('status','A')->count();
        
        $last_30_days_clients = Client::where('created_at','>=', $date->subdays(30))->count();
        
        $last_year_clients = Client::whereYear('created_at',$date)->count();
        
        $total_sales = Sale::selectRaw('sum(details_sales.subtotal) total')
                            ->leftJoin('details_sales', 'details_sales.id_sale', '=', 'sales.id')
                            ->get();
        
        $client_departments = Client::selectRaw('departments.name , count(clients.id) total')
                                    //->select('people.name', 'people.department')
                                    ->leftJoin('people', 'people.dpi', '=', 'clients.dpi')
                                    ->leftJoin('departments','people.id_department', '=', 'departments.id')
                                    ->groupBy('departments.name')
                                    ->where('clients.status','A')
                                    ->get();
        
        $range_year_old = Client::selectRaw("
                                    CASE WHEN (people.age BETWEEN 20 AND 24) THEN 'Entre 20 a 24' ELSE
                                        CASE WHEN (people.age BETWEEN 25 AND 29) THEN 'Entre 25 a 29' ELSE
                                            CASE WHEN (people.age BETWEEN 30 AND 34) THEN 'Entre 30 a 34' ELSE
                                                CASE WHEN (people.age BETWEEN 35 AND 39) THEN 'Entre 35 a 39' ELSE
                                                    CASE WHEN (people.age BETWEEN 40 AND 44) THEN 'Entre 40 a 44' ELSE
                                                        CASE WHEN (people.age BETWEEN 45 AND 49) THEN 'Entre 45 a 49' ELSE
                                                            CASE WHEN (people.age >= 50) THEN 'De 50 o más'
                                                            END
                                                        END
                                                    END
                                                END
                                            END
                                        END
                                    END rango,
                                    COUNT(*) total
                                ")
                                ->leftJoin('people','people.dpi', '=', 'clients.dpi')
                                ->groupBy('rango')
                                ->get();

        $sales_months_year = Sale::selectRaw('month(sales.created_at) month, sum(details_sales.subtotal) total')
                                    ->leftJoin('details_sales','details_sales.id_sale','=','sales.id')
                                    ->whereYear('sales.created_at', $date->year )
                                    ->groupBy('month')
                                    ->get();

        $months = [
            'Enero',
            'Febrero',
            'Marzo',
            'Abril',
            'Mayo',
            'Junio',
            'Julio',
            'Agosto',
            'Septiembre',
            'Octubre',
            'Noviembre',
            'Diciembre',
        ];

        for($i = 0; $i < 12; $i++) {
            $filter = (array_filter(json_decode($sales_months_year, true), function($v) use($i) {
                //dd($i);
                return $v['month'] == $i+1;
            }, ARRAY_FILTER_USE_BOTH));
            
            if($filter) {
                $months[$i] = [
                    'month' => $months[$i],
                    'total' => $filter[0]['total']
                ];
            }else {
                $months[$i] = [
                    'month' => $months[$i],
                    'total' => 0
                ];
            }
            
        }
        //dd($months);

        return response([
            "clients" =>  $total_clients,
            "sales" => $total_sales[0]['total'],
            "last_30_days_clients" => $last_30_days_clients,
            "last_year_clients" => $last_year_clients,
            "departments" => $client_departments,
            'old_year' => $range_year_old,
            'sales_month_year' => $months
        ], 200);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function reportClient (Request $request, $id) {
        
        $date = Carbon::now();
        $clientSales = Client::selectRaw('sum(details_sales.subtotal) total')
                        ->where('clients.id','=',$id)
                        ->leftJoin('sales', 'clients.id', '=', 'sales.id_client')
                        ->leftJoin('details_sales', 'details_sales.id_sale', '=', 'sales.id')
                        ->get();
                        
        
        $clientSalesLast30Days = Client::selectRaw('day(sales.created_at) day ,sum(details_sales.subtotal) total')
                                        ->where('clients.id',$id)
                                        ->leftJoin('sales', 'clients.id', '=', 'sales.id_client')
                                        ->leftJoin('details_sales','details_sales.id_sale','=','sales.id')
                                        ->where('sales.created_at', '>=', $date->subdays(30))
                                        ->groupBy('day')
                                        ->get();
        
        // $clientSalesLastYear = Client::where('clients.id',$id)
        //                                 ->leftJoin('sales', 'clients.id', '=', 'sales.id_client')
        //                                 ->whereYear('sales.created_at', $date->year - 1)->count();
        
        $sales_months_year = Client::selectRaw('month(sales.created_at) month, sum(details_sales.subtotal) total')
                                    ->where('clients.id',$id)
                                    ->leftJoin('sales', 'clients.id', '=', 'sales.id_client')
                                    ->leftJoin('details_sales','details_sales.id_sale','=','sales.id')
                                    ->whereYear('sales.created_at', $date->year )
                                    ->groupBy('month')
                                    ->get();
        
        $days = [];

        $months = [
            'Enero',
            'Febrero',
            'Marzo',
            'Abril',
            'Mayo',
            'Junio',
            'Julio',
            'Agosto',
            'Septiembre',
            'Octubre',
            'Noviembre',
            'Diciembre',
        ];

        for($i = 0; $i < 12; $i++) {
            $filter = (array_filter(json_decode($sales_months_year, true), function($v) use($i) {
                //dd($i);
                return $v['month'] == $i+1;
            }, ARRAY_FILTER_USE_BOTH));
            
            if($filter) {
                $months[$i] = [
                    'month' => $months[$i],
                    'total' => $filter[0]['total']
                ];
            }else {
                $months[$i] = [
                    'month' => $months[$i],
                    'total' => 0
                ];
            }
            
        }

        for($i = 1; $i < 30; $i++) {
            $filter = (array_filter(json_decode($clientSalesLast30Days, true), function($v) use($i) {
                //dd($i);
                return $v['day'] == $i;
            }, ARRAY_FILTER_USE_BOTH));
            
            if($filter) {
                $days[] = [
                    'day' => $filter[0]['day'],
                    'total' => $filter[0]['total']
                ];
            }else {
                $days[] = [
                    'day' => $i,
                    'total' => 0
                ];
            }
            
        }
        
        return response([
            "total_sales" => $clientSales[0]['total'],
            "total_last_30_days_sales" => $days,
            "total_year_sales" => $months
        ], 200);
    }
}
