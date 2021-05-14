<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $products = DB::table('products')
                        ->select('id', 'name', 'price', 'description')
                        ->get();
        
        return $products;
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
        // try {
        //     foreach ($request->get('products') as $key => $product) {
        //         # code...
        //         $prueba = Product::create([
        //             'name' => $product['name'],
        //             'price' => floatval($product['price']),
        //             'description' => $product['description']
        //         ]);
        //     }

        //     return response([
        //         'message' => 'Total de productos insertardos '. sizeof($request->get('products'))
        //     ]);

        // } catch (\Throwable $th) {
        //     //throw $th;
        //     return $th->getMessage();
        // }        

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'price' => 'required|decimal',
            'description' => 'required|string|max:255'
        ]);

        if($validator->fails()) {
            return response($validator->errors(), 400);
        }

        try {
            $product = Product::create([
                'name' => $request->get('name'),
                'price' => $request->get('price'),
                'description' => $request->get('description')
            ]);

            return response([
                'message' => 'Producto agregado'
            ], 200);
        } catch (\Throwable $th) {
            return $th->getMessage();
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
        $products = DB::table('products')
                        ->where('id', $id)
                        ->select('id', 'name', 'price', 'description')
                        ->get();
        
        return $products;
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
