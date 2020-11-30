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
    // return phpinfo();
    return view('welcome');
});

Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');
Route::get('/welcome', 'HomeController@index')->name('home');

// Route::get('/user/create', 'UserController@create'); //access($request, Closure $next, $key='user', $object='none') $key='admin', 'user' or 'both'
Route::get('/user/create', 'UserController@create')->middleware('access:admin'); //access($request, Closure $next, $key='user', $object='none') $key='admin', 'user' or 'both'
// Route::get('/user/create', 'UserController@create');
// Route::post('/user/store', 'UserController@store');
Route::post('/user/store', 'UserController@store')->middleware('access:admin');
Route::get('/user/{user}', 'UserController@show')->middleware('access:both,user');
Route::patch('/user/{user}/update', 'UserController@update')->middleware('access:both,user');
Route::get('/user/{user}/killreports', 'UserController@killreports')->middleware('access:both,user');

Route::get('/killreports/create', 'KillreportController@create')->middleware('access:both,none');
Route::post('/killreports/store', 'KillreportController@store')->middleware('access:both,none');
Route::get('/killreports/{killreport}/edit', 'KillreportController@edit')->middleware('access:both,none');
Route::post('/killreports/{killreport}/update', 'KillreportController@update')->middleware('access:both,none');
Route::post('/killreports/{killreport}/delete', 'KillreportController@destroy')->middleware('access:admin');
Route::get('killreports/{killreport}', 'KillreportController@show')->middleware('access:both,killreport');
Route::get('/killreports', 'KillreportController@index')->middleware('access:both,none');

Route::post('/animals/store', 'AnimalController@store')->middleware('access:both,none');
Route::post('/animals/{animal}/update', 'AnimalController@update')->middleware('access:both,none');

Route::get('/meat/{killreport}/edit', 'MeatController@edit')->middleware('access:both,none');
Route::patch('/meat/{meat}/update', 'MeatController@update')->middleware('access:both,none');
Route::post('/meat/store', 'MeatController@store')->middleware('access:both,none');
Route::delete('/meat/{meat}/delete', 'MeatController@destroy')->middleware('access:both,none');

Route::get('/data', 'DataController@index')->middleware('access:both,none');

Route::get('/image/{killreport}/edit', 'KillreportImageController@edit')->middleware('access:both,none');
Route::patch('/image/{image}/update', 'KillreportImageController@update')->middleware('access:both,none');
Route::post('/image/{killreport}/store', 'KillreportImageController@store')->middleware('access:both,none');
Route::delete('/image/{image}/delete', 'KillreportImageController@destroy')->middleware('access:both,none');

Route::get('avatar/{user}/edit', 'AvatarImageController@edit')->middleware('access:user, user');
Route::post('avatar/store', 'AvatarImageController@store')->middleware('access:user, user');
Route::delete('avatar/{avatar}/delete', 'AvatarImageController@destroy')->middleware('access:user, user');

Route::post('avatarfile/store', 'AvatarFileController@store')->middleware('access:both, user');
Route::delete('avatarfile/{avatar}/delete', 'AvatarFileController@destroy')->middleware('access:both, user');
Route::patch('avatarfile/{avatar}/rotate', 'AvatarFileController@update_rotate')->middleware('access:both, user');


Route::post('/killreportfile/store', 'KillreportFileController@store')->middleware('access:both,none');
Route::patch('/killreportfile/{id}/rotate', 'KillreportFileController@update_rotate')->middleware('access:both,none');
Route::delete('/killreportfile/{id}/delete', 'KillreportFileController@destroy')->middleware('access:both,none');

Route::get('/admin', 'AdminController@index')->middleware('access:admin,none');

Route::get('/password', 'UserController@resetlink');
Route::post('login', 'Auth\LoginController@login');
// Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');
