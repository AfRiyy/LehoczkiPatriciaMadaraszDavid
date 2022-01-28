<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Pets;
use App\Http\Controllers\PetsController;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Cookie;
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
Route::group(["middleware" => ["auth:sanctum"]], function() {
    Route::post('/logout', [AuthController::class, "signOff"]);

    Route::post('/pets',[PetsController::class,'create']);
    Route::put('/pets/{pet}',[PetsController::class,'update']);
    Route::delete('/pets/{pet}',[PetsController::class,'delete']);

    Route::post('/species',[SpecieController::class,'create']);
    Route::put('/species/{specie}',[SpecieController::class,'update']);
    Route::delete('/species/{specie}',[SpecieController::class,'delete']);
    
    Route::post('/breeds',[BreedController::class,'create']);
    Route::put('/breeds/{breed}',[BreedController::class,'update']);
    Route::delete('/breeds/{breed}',[BreedController::class,'delete']);
});
Route::post('/login', [AuthController::class, "signIn"]);
Route::post('/register', [AuthController::class, "signUp"]);

Route::get('/pets',[PetsController::class,'index']);
Route::get('/pets/{pet}',[PetsController::class,'show']);

Route::get('/species',[SpecieController::class,'index']);
Route::get('/species/{specie}',[SpecieController::class,'show']);

Route::get('/breeds',[BreedController::class,'index']);
Route::get('/breeds/{breed}',[BreedController::class,'show']);


