<?php

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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

// Route::get('/user/create', 'UserController@create'); //access($request, Closure $next, $key='user', $object='none') $key='admin', 'user' or 'both'
Route::get('/user/create', 'UserController@create')->middleware('access:admin'); //access($request, Closure $next, $key='user', $object='none') $key='admin', 'user' or 'both'
// Route::get('/user/create', 'UserController@create');
// Route::post('/user/store', 'UserController@store');
Route::post('/user/store', 'UserController@store')->middleware('access:admin');
Route::get('/user/{user}', 'UserController@show')->middleware('access:both,user');
Route::patch('/user/{user}/update', 'UserController@update')->middleware('access:both,user');

Route::get('/killreports/create', 'KillreportController@create')->middleware('access:both,none');
Route::post('/killreports/store', 'KillreportController@store')->middleware('access:both,none');
Route::get('/killreports/{killreport}/edit', 'KillreportController@edit')->middleware('access:both,none');
Route::get('killreports/{killreport}', 'KillreportController@show')->middleware('access:both,killreport');
Route::get('/killreports', 'KillreportController@index')->middleware('access:both,none');

Route::post('/animals/store', 'AnimalController@store')->middleware('access:both,none');
