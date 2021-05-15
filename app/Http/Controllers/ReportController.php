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
    public function report(Request $request) {
        // $sales = Sale::all();
        
        // foreach ($sales as $key => $sale) {
        //     $id_sale = $sale->id;
        //     $detail_sale = DetailsSale::all()->where('id_sale', $id_sale);
            
        //     $amount = 0;
        //     $quantity = 0;

        //     $other = array_filter(json_decode($detail_sale, true), function($key) {
        //         //dd($value);
        //         if(isset($key['amount'])) {
        //             return $key['amount'];
        //         }
        //     });

        //     dd($other);

        //     //dd(json_decode($detail_sale, true));

        //     foreach ($detail_sale as $key => $detail) {
        //         # code...
        //         foreach (json_decode($detail) as $key => $value) {
        //             # code...
        //             if($key == 'subtotal' || $key == 'quantity') {
        //                 $amount += $value;
        //                 $quantity += $value;
        //             }
        //         }
        //     }
            
        //     $sales[$key]['details_sales'] = $detail_sale;
            
        //     $sales[$key]['total_quantity'] = $detail_sale;
        //     //dd($sales);
        // }
        $date = Carbon::now();
        $total_clients = Client::all()->count();
        //$LastMountClients = Client::all()->where('')
        $last_30_days_clients = Client::where('created_at','>=', $date->subdays(30))->count();
        //$last_year_clients = Client::whereBetween('created_at', [date('Y', strtotime('-1 year')), Carbon::now()])->count();
        //dd(Carbon::now()->year-1);
        $last_year_clients = Client::whereYear('created_at',$date->year - 1)->count();
        $total_sales = Sale::all()->count();
        
        $client_departments = Client::selectRaw('departments.name as name, count(clients.id) total')
                                    //->select('departments.name', 'count(clients.id) total')
                                    ->leftJoin('people', 'people.dpi', '=', 'clients.dpi')
                                    ->leftJoin('departments','people.department','departments.name')
                                    ->groupBy('departments.name')
                                    ->get();

        return response([
            "clients" =>  $total_clients,
            "sales" => $total_sales,
            "last_30_days_clients" => $last_30_days_clients,
            "last_year_clients" => $last_year_clients,
            "departments" => $client_departments
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    //public function 
}
