<?php

namespace App\Http\Controllers;

use App\Models\People;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class PeopleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'dpi' => 'required|max:13',
            'name' => 'required|string',
            'last_name' => 'required|string',
            'nit' => 'required|string|max:10',
            'age' => 'required|integer',
            'address' => 'required|string',
            'id_department' => 'required|string',
            'id_township' => 'require|string'
        ]);

        if($validator->fails()) {
            return response($validator->errors(),400);
        }

        try {
            $people = People::create([
                'dpi' => $request->get('dpi'),
                'name' => $request->get('name'),
                'last_name' => $request->get('last_name'),
                'nit' => $request->get('nit'),
                'age' => $request->get('age'),
                'address' => $request->get('address')
            ]);

            return response([
                'message' => 'Datos agregados',
                'data' => $people
            ], 200);

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
