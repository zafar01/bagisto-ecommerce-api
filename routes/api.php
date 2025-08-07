<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
 
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;

Route::get('/categories/short', [CategoryController::class, 'index']);
Route::get('/products/short', [ProductController::class, 'index']);