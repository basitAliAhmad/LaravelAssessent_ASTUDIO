<?php

namespace App\Http\Controllers\Api;

use App\Exception\ResourceNotFoundException;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserApiController extends Controller
{
    public function getAll(Request $request)
    {
        try {
            $users = User::all();
            return response()->json([
                'status' => true,
                'message' => 'OK',
                'data' => $users,
            ], 200);
        } catch (\Throwable $th) {
            return $this->errorMessage($th);
        }
    }

    public function getById(Request $request, $id): JsonResponse
    {
        try {
            $user = User::find($id);

            if ($user)
                return response()->json([
                    'status' => true,
                    'message' => 'OK',
                    'data' => $user,
                ], 200);
            else
                throw new ResourceNotFoundException("User Not Found");

        } catch (\Throwable $th) {
            if ($th instanceof ResourceNotFoundException)
                return $this->resourceNotFoundMessage($th);
            return $this->errorMessage($th);
        }
    }
}
