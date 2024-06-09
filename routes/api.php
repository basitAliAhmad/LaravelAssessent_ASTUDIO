<?php

use App\Http\Controllers\Api\AuthApiController;
use App\Http\Controllers\Api\ProjectApiController;
use App\Http\Controllers\Api\TimeSheetApiController;
use App\Http\Controllers\Api\UserApiController;
use Illuminate\Support\Facades\Route;


Route::controller(AuthApiController::class)->group(function () {
    Route::post('/auth/register', 'register');
    Route::post('/auth/login', 'login');
});

Route::group([
    'middleware' => ["auth:sanctum"],
], function () {

    Route::controller(AuthApiController::class)->group(function () {
        Route::get('/auth/profile', 'profile');
        Route::post('/auth/logout', 'logout');
    });

    Route::controller(UserApiController::class)->group(function () {
        Route::get('/user', 'getAll');
        Route::get('/user/{id}', 'getById');
    });

    Route::controller(ProjectApiController::class)->group(function () {
        Route::get('/project', 'getAll');
        Route::get('/project/{id}', 'getById');
        Route::post('/project', 'create');
        Route::put('/project/{id}', 'update');
        Route::delete('/project/{id}', 'delete');
    });

    Route::controller(TimeSheetApiController::class)->group(function () {
       Route::get('/timesheet', 'getAll');
       Route::get('/timesheet/{id}', 'getById');
       Route::post('/timesheet', 'create');
       Route::put('/timesheet/{id}', 'update');
       Route::delete('/timesheet/{id}', 'delete');
    });
});




