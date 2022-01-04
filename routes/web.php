<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\bakery\HomeController;
use App\Http\Controllers\bakery\DetailsController;
use App\Http\Controllers\cart\cart_controller;
use App\Http\Controllers\account\LoginController;
use App\Http\Controllers\search\search_controller;
use App\Http\Controllers\admin\admin_controller;

Route::prefix('cart')->group(function () {
	Route::get('/',[cart_controller::class,'cart'])->name('cart');
	Route::post('/update/{id}',[cart_controller::class,'cart_update'])->name('cart_update');
	Route::get('/delete/{id}',[cart_controller::class,'cart_delete'])->name('cart_delete');
	Route::get('/delete_all',[cart_controller::class,'cart_delete_all'])->name('cart_delete_all');
	Route::post('/order',[cart_controller::class,'cart_order'])->name('cart_order');
});
Route::get('details/{id}', [DetailsController::class, 'details'])->name('book_details');
Route::post('add_cart/{id}', [DetailsController::class, 'add_cart'])->name('add_cart');
Route::post('order_now/{id}', [DetailsController::class, 'order_now'])->name('order_now');

Route::get('login' , [LoginController::class , 'signin'])->name('login');
Route::get('signup' , [LoginController::class , 'signup'])->name('register');
Route::post('create_user' , [LoginController::class , 'new_user'])->name('new_user');
Route::post('check_login' , [LoginController::class , 'postLogin'])->name('check_login');

Route::get('{return?}' , [search_controller::class , 'search_view'])->name('home');
Route::prefix('home')->group(function () {
	Route::get('/{return?}' , [search_controller::class , 'search_view'])->name('search_view');
	Route::post('store' , [search_controller::class , 'search_store'])->name('search_store');
});

Route::prefix('admin')->group(function () {
	Route::prefix('users')->group(function () {

		Route::get('/' , [ admin_controller::class , 'admin_user_lists' ])
			->name('admin_user_lists');
		Route::get('/index' , [ admin_controller::class , 'admin_user_lists' ])
			->name('admin_user_lists');
		Route::get('/add' , [ admin_controller::class , 'admin_user_add' ])
			->name('admin_user_add');
		Route::post('/store' , [ admin_controller::class , 'admin_user_store' ])
			->name('admin_user_store');
		Route::get('/edit/{id}' , [ admin_controller::class , 'admin_user_edit' ])
			->name('admin_user_edit');
		Route::put('/update/{id}' , [ admin_controller::class , 'admin_user_update' ])
			->name('admin_user_update');
		Route::get('/delete/{id}' , [ admin_controller::class , 'admin_user_delete' ])
			->name('admin_user_delete');
		Route::get('/comments/{id}' , [ admin_controller::class , 'admin_user_comment' ])
			->name('admin_user_comment');

	});
	Route::prefix('bookstores')->group(function () {

		Route::get('/' , [ admin_controller::class , 'admin_bookstore_lists' ])
			->name('admin_bookstore_lists');
		Route::get('/index' , [ admin_controller::class , 'admin_bookstore_lists' ])
			->name('admin_bookstore_lists');
		Route::get('/add' , [ admin_controller::class , 'admin_bookstore_add' ])
			->name('admin_bookstore_add');
		Route::post('/store' , [ admin_controller::class , 'admin_bookstore_store' ])
			->name('admin_bookstore_store');
		Route::get('/edit/{id}' , [ admin_controller::class , 'admin_bookstore_edit' ])
			->name('admin_bookstore_edit');
		Route::put('/update/{id}' , [ admin_controller::class , 'admin_bookstore_update' ])
			->name('admin_bookstore_update');
		Route::get('/delete/{id}' , [ admin_controller::class , 'admin_bookstore_delete' ])
			->name('admin_bookstore_delete');

	});
	Route::prefix('books')->group(function () {

		Route::get('/' , [ admin_controller::class , 'admin_book_lists' ])
			->name('admin_book_lists');
		Route::get('/index' , [ admin_controller::class , 'admin_book_lists' ])
			->name('admin_book_lists');
		Route::get('/add' , [ admin_controller::class , 'admin_book_add' ])
			->name('admin_book_add');
		Route::post('/store' , [ admin_controller::class , 'admin_book_store' ])
			->name('admin_book_store');
		Route::get('/edit/{id}' , [ admin_controller::class , 'admin_book_edit' ])
			->name('admin_book_edit');
		Route::put('/update/{id}' , [ admin_controller::class , 'admin_book_update' ])
			->name('admin_book_update');
		Route::get('/delete/{id}' , [ admin_controller::class , 'admin_book_delete' ])
			->name('admin_book_delete');

	});
	Route::prefix('tags')->group(function () {

		Route::get('/' , [ admin_controller::class , 'admin_tag_lists' ])
			->name('admin_tag_lists');
		Route::get('/index' , [ admin_controller::class , 'admin_tag_lists' ])
			->name('admin_tag_lists');
		Route::get('/add' , [ admin_controller::class , 'admin_tag_add' ])
			->name('admin_tag_add');
		Route::post('/store' , [ admin_controller::class , 'admin_tag_store' ])
			->name('admin_tag_store');
		Route::get('/edit/{id}' , [ admin_controller::class , 'admin_tag_edit' ])
			->name('admin_tag_edit');
		Route::put('/update/{id}' , [ admin_controller::class , 'admin_tag_update' ])
			->name('admin_tag_update');
		Route::get('/delete/{id}' , [ admin_controller::class , 'admin_tag_delete' ])
			->name('admin_tag_delete');

	});
});

Route::get('/', [HomeController::class, 'home'])->name('home');
Route::get('signin', [LoginController::class, 'signin'])->name('login');
Route::get('signup', [LoginController::class, 'signup'])->name('register');
Route::post('auth_user', [LoginController::class, 'auth_user'])->name('auth_user');
