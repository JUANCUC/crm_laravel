<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\People;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request) {
        dd($request);
    }
}
