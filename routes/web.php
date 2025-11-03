<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\ProductController;
use App\Http\Controllers\Web\UserController;

/*Route::get('/', function () {
    return view('welcome');
});*/

Route::get('/', fn() => redirect()->route('login'));

Route::middleware('guest')->group(function () {
    Route::get('/login', [AuthController::class,'showLoginForm'])->name('login');
    Route::post('/login', [AuthController::class,'login'])->name('login.submit');
    Route::get('/register', [AuthController::class,'showRegisterForm'])->name('register');
    Route::post('/register', [AuthController::class,'register'])->name('register.submit');
});

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', fn() => redirect()->route('products.index'))->name('dashboard');
    Route::get('/products', [ProductController::class,'index'])->name('products.index');
    Route::get('/users', [UserController::class,'index'])->middleware('admin')->name('users.index');
    Route::post('/logout', [AuthController::class,'logout'])->name('logout');
});
