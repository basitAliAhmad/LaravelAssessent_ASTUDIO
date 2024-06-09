<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;

abstract class Controller
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function resourceNotFoundMessage(\Throwable $exception)
    {
        return response()->json([
        'status' => false,
        'message' => 'Resource not found!',
        'details' => $exception->getMessage(),
        ], 404);
    }

    protected function validationFailedMessage(\Throwable $th)
    {
        return response()->json([
            'status' => false,
            'message' => 'Request Validation Failed',
            'details' => json_decode($th->getMessage()),
        ], 400);
    }

    protected function resourceOwnershipConflict($th)
    {
        return response()->json([
        'status' => false,
        'message' => $th->getMessage(),
        ], 403);
    }

    protected function errorMessage(\Throwable $th) {
        return response()->json([
            'status' => false,
            'message' => 'Internal Server Error',
            'details' => $th->getMessage(),
        ], 500);
    }
}
