<?php

namespace App\Http\Controllers;

use App\Models\Township;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class TownshipController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $departments = DB::table('townships')
                            ->leftJoin('departments', 'townships.id_department', '=', 'departments.id')
                            ->select('townships.id', 'townships.name', 'departments.id as id_department', 'departments.name as department')
                            ->get();

        return $departments;
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
            'id_department' => 'required|int',
            'name' => 'required|string',
        ]);

        if($validator->fails()) {
            return response($validator->errors(), 400);
        }
        

        try {
            // foreach ($request->get('townships') as $key => $township) {
            //     # code...
            //     $id_department = $township['id'];
            //     foreach ($township['municipios'] as $key => $value) {
            //         # code...    
            //         $prueba = Township::create([
            //             'id_department' => $id_department,
            //             'name' => $value,
            //         ]);
                    
            //     }
            // }
            
            $township = Township::create([
                'id_department' => $request->get('id_department'),
                'name' => $request->get('name'),
            ]);

            return response([
                'message' => 'Municipio insertardo ',
            ]);

        } catch (\Throwable $th) {
            //throw $th;
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
