<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;

/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');*/

Route::post('/register', [AuthController::class,'register']);
Route::post('/login', [AuthController::class,'login']);

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/user', function(Request $request){ return $request->user(); });

    Route::post('/logout', [AuthController::class,'logout']);

    Route::get('/products', [ProductController::class,'index']);
    Route::post('/products', [ProductController::class,'store']);
    Route::get('/products/{product}', [ProductController::class,'show']);
    Route::post('/products/{product}', [ProductController::class,'update']); // or put/patch
    Route::delete('/products/{product}', [ProductController::class,'destroy']);

    Route::get('/users', [UserController::class,'index'])->middleware('admin');
    Route::delete('/users/{user}', [UserController::class,'destroy'])->middleware('admin');

    Route::get('/users/{id}', [UserController::class,'show']);
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::delete('/users/{id}', [UserController::class, 'destroy']);
    Route::patch('/users/{id}/status', [UserController::class, 'changeStatus']);

});
