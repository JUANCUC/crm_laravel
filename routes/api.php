<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Route::post('register', 'UserController@register');
Route::post('login', 'UserController@authenticate');

Route::group(['middleware' => ['jwt.verify']], function() {
    // Route::post('user','UserController@getAuthenticatedUser');
    // Route::resource('departments', 'DepartmentController')->only(['index']);
    // Route::resource('townships', 'TownshipController')->only(['index']);
    // Route::resource('products', 'ProductController')->only(['index','store', 'show']);
    // //Route::resource('people', 'PeopleController')->only(['store']);
    // Route::resource('clients', 'ClientController');
    // Route::resource('sales', 'SaleController');
    // Route::resource('detail-sales', 'DetailSaleController');
    Route::post('user','UserController@getAuthenticatedUser');
    Route::resource('departments', 'DepartmentController')->only(['index']);
    Route::resource('townships', 'TownshipController')->only(['index','update']);
    Route::resource('products', 'ProductController')->only(['index','store', 'show']);
    //Route::resource('people', 'PeopleController')->only(['store']);
    Route::resource('clients', 'ClientController');
    Route::resource('sales', 'SaleController');
    Route::resource('detail-sales', 'DetailSaleController');

    Route::get('reports-general', 'ReportController@reportGeneral');
    Route::get('reports-client/{id}', 'ReportController@reportClient');
});


