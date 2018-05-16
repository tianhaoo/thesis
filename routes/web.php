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
    return redirect('/blog');
});

Auth::routes();

Route::get('/home', function (){
	return redirect('/blog');
})->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    // 重载登录路由
    Route::get('/login', ['uses' => 'Auth\LoginController@showLoginForm', 'as' => 'voyager.login']);
    Route::post('/login', ['uses' => 'Auth\LoginController@login', 'as' => 'voyager.postlogin']);
    Route::post('/logout', ['uses' => 'Auth\LoginController@logout', 'as' => 'voyager.logout']);
});


Route::get('/blog', 'BlogController@index');
Route::get('/post/{slug}', 'BlogController@show');

Route::get('/tags/{tag}', 'BlogController@tagShow');
Route::get('/category/{id}', 'BlogController@categoryShow');


Route::post('/ajax/thumbs', 'BlogController@thumbs');

Route::post('/comment/create', 'CommentController@create');
Route::post('/comment/delete/{id}', 'CommentController@delete');

