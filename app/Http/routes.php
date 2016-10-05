<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::auth();

Route::group(['middleware' => ['auth']], function() {

	Route::get('/home', 'HomeController@index');

	Route::resource('users','UserController');

	// For Role
	Route::get('roles',['as'=>'roles.index','uses'=>'RoleController@index','middleware' => ['permission:role-list|role-create|role-edit|role-delete']]);
	Route::get('roles/create',['as'=>'roles.create','uses'=>'RoleController@create','middleware' => ['permission:role-create']]);
	Route::post('roles/create',['as'=>'roles.store','uses'=>'RoleController@store','middleware' => ['permission:role-create']]);
	Route::get('roles/{id}',['as'=>'roles.show','uses'=>'RoleController@show']);
	Route::get('roles/{id}/edit',['as'=>'roles.edit','uses'=>'RoleController@edit','middleware' => ['permission:role-edit']]);
	Route::patch('roles/{id}',['as'=>'roles.update','uses'=>'RoleController@update','middleware' => ['permission:role-edit']]);
	Route::delete('roles/{id}',['as'=>'roles.destroy','uses'=>'RoleController@destroy','middleware' => ['permission:role-delete']]);

	// For Boook
	Route::get('book',['as'=>'book.index','uses'=>'BookController@index','middleware' => ['permission:book-list|book-create|book-edit|boook-delete']]);
	Route::get('book/create',['as'=>'book.create','uses'=>'BookController@create','middleware' => ['permission:book-create']]);
	Route::post('book/create',['as'=>'book.store','uses'=>'BookController@store','middleware' => ['permission:book-create']]);
	Route::get('book/{id}',['as'=>'book.show','uses'=>'BookController@show']);
	Route::get('book/{id}/edit',['as'=>'book.edit','uses'=>'BookController@edit','middleware' => ['permission:book-edit']]);
	Route::patch('book/{id}',['as'=>'book.update','uses'=>'BookController@update','middleware' => ['permission:book-edit']]);
	Route::delete('book/{id}',['as'=>'book.destroy','uses'=>'BookController@destroy','middleware' => ['permission:book-delete']]);

        
        // For Request
	Route::get('request',['as'=>'request.index','uses'=>'RequestsController@index','middleware' => ['permission:request-list|request-create|request-edit|request-delete']]);
	Route::get('request/create',['as'=>'request.create','uses'=>'RequestsController@create','middleware' => ['permission:request-create']]);
	Route::post('request/create',['as'=>'request.store','uses'=>'RequestsController@store','middleware' => ['permission:request-create']]);
	Route::get('request/{id}',['as'=>'request.show','uses'=>'RequestsController@show']);
	Route::get('request/{id}/edit',['as'=>'request.edit','uses'=>'RequestsController@edit','middleware' => ['permission:request-edit']]);
	Route::patch('request/{id}',['as'=>'request.update','uses'=>'RequestsController@update','middleware' => ['permission:request-edit']]);
	Route::delete('request/{id}',['as'=>'request.destroy','uses'=>'RequestsController@destroy','middleware' => ['permission:request-delete']]);

});
