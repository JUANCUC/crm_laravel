<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Models\DetailsSale;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class DetailSaleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        // $details_sales = DB::table('details_sales')
        //                     ->leftJoin('sales', 'sales.id', '=', 'details_sales.id_sale')
        //                     ->leftJoin('clients', 'clients.id', '=', 'sales.id_client')
        //                     ->leftJoin('people', 'people.dpi', '=', 'clients.dpi')
        //                     ->selectRaw(
        //                         'sales.id as id,'.
        //                         'people.last_name as last_name,'. 
        //                         'people.age as age,'.
        //                         'people.nit as nit,'.
        //                         'people.address as address,'. 
        //                         'people.department as department,'. 
        //                         'people.township as township,'.
        //                         'people.name,'. 
        //                         'sum(details_sales.subtotal) as amount,'. 
        //                         'sum(details_sales.quantity) as total'
        //                     )
        //                     // ->select(
        //                     //     'people.name as name', 
        //                     //     'people.last_name as last_name', 
        //                     //     'people.age as age',
        //                     //     'people.nit as nit',
        //                     //     'people.address as address', 
        //                     //     'people.department as department', 
        //                     //     'people.township as township',
        //                     //     'sales.total_quantity as total',
        //                     //     'sales.total_amount as amount'
        //                     // )
        //                     ->groupBy(
        //                         'details_sales.id',
        //                         'sales.id', 
        //                         'people.name',
        //                         'people.last_name', 
        //                         'people.age',
        //                         'people.nit',
        //                         'people.address', 
        //                         'people.department', 
        //                         'people.township',
        //                     )->get();
        $sales = DetailsSale::leftJoin('sales', 'sales.id', '=', 'details_sales.id_sale')
                            ->leftJoin('clients', 'clients.id', '=', 'sales.id_client')
                            ->get();
        
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
        
        return $sales;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'id_client' => 'required|integer',
            'id_user' => 'required|integer',
            'details_sales' => 'required',
            //'id_product' => 'required|integer',
            //'quantity' => 'required|integer',
            //'amount' => 'required',
        ]);

        if($validator->fails()) {
            return response($validator->errors(),400);
        }

        try {

            $sale = Sale::create([
                'id_client' => $request->get('id_client'),
                'id_user' => $request->get('id_user'),
                'total_quantity' => 0,
                'total_amount' => 0
            ]);
            
            $id_sale = $sale->id;
            
            foreach($request->get('details_sales') as $key => $detail) {
               
                $amount = $detail['amount'];
                $quantity = $detail['quantity'];
                $subtotal = $amount * $quantity;
                
                $detail_sale = DetailsSale::create([
                    'id_sale' => $id_sale,
                    'id_product' => $detail['id_product'],
                    'quantity' => $quantity,
                    'amount' => $amount,
                    'subtotal' => $subtotal
                ]);

            }
            
            $sales = Sale::where('sales.id', $id_sale)
                            ->leftJoin('details_sales', 'details_sales.id_sale', '=', 'sales.id')
                            ->get();
                       
            //dd($detail_sale);

            return response($sales, 200);

        } catch (\Throwable $th) {
            //throw $th;
            return response([
                'messageError' =>  $th->getMessage()
            ], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
