<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SetCodeController;
use App\Http\Controllers\Api\SetYearController;
use App\Http\Controllers\Api\KeyValueController;
use App\Http\Controllers\Api\FeesController;



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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix'=> 'v1'], function () {
    Route::any('login', [AuthController::class, 'login'])->name('login');
    Route::get('fee-by-year-code', [FeesController::class, 'fee_by_year_code']);
    Route::middleware('auth:api')->group(function () {
        Route::post('set-code', [SetCodeController::class, 'store']);
        Route::get('codes', [SetCodeController::class, 'index']);
        Route::post('set-year', [SetYearController::class, 'store']);
        Route::get('years', [SetYearController::class, 'index']);
        Route::post('set-key-value', [KeyValueController::class, 'store']);
        Route::get('key-values', [KeyValueController::class, 'index']);
        Route::post('set-fee', [FeesController::class, 'store']);
        Route::get('fees', [FeesController::class, 'index']);
        Route::post('logout', [AuthController::class, 'logout']);
    });
});