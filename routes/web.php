<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/*Login*/

Route::get('/main', 'AuthController@index');
Route::post('/main/checklogin', 'AuthController@checklogin');
Route::get('/main/successlogin', 'AuthController@successlogin');
Route::get('main/logout', 'AuthController@logout');

/* Chat */
Route::get('/mainchat', 'ChatController@index');
Route::post('/mainchat/balance_change', 'ChatController@balance_change');