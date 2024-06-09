<?php

namespace App\Http\Controllers\Api;

use App\Exception\RequestValidationException;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class AuthApiController extends Controller
{
    public function login(Request $request): JsonResponse
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|string|email|max:255',
                'password' => 'required|string',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator);

            if (!Auth::attempt($request->only(['email', 'password']))) {
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid Email or Password',
                ], 401);
            }

            $user = User::where('email', $request->email)->first();
            return response()->json([
                'status' => true,
                'message' => 'Login Success',
                'token' => $user->createToken('API_TOKEN')->plainTextToken,
            ]);

        } catch (\Throwable $throwable) {
            if ($throwable instanceof RequestValidationException)
                return $this->errorMessage($throwable);
            return $this->errorMessage($throwable);
        }
    }

    public function register(Request $request): JsonResponse
    {
        try {
            $validator = Validator::make($request->all(), [
                'first_name' => 'required',
                'email' => 'required|email',
                'gender' => 'required|in:male,female',
                'date_of_birth' => 'required',
                'password' => 'required',
                'c_password' => 'required|same:password',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator->errors());

            $user = User::where('email', $request->email)->first();

            if ($user) {
                return response()->json([
                    'status' => false,
                    'message' => 'Email already exists',
                ], 409);
            }

            $user = User::create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'date_of_birth' => $request->date_of_birth,
                'gender' => $request->gender,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User register successfully',
                'token' => $user->createToken('API_TOKEN')->plainTextToken,
            ], 200);
        } catch (\Throwable $th) {
            if ($th instanceof RequestValidationException)
                return $this->validationFailedMessage($th);
            return $this->errorMessage($th);
        }
    }

    public function profile(): JsonResponse
    {
        try {
            $userProfile = auth()->user();
            return response()->json([
                'status' => true,
                'message' => 'Profile Information',
                'id' => Auth::id(),
                'data' => $userProfile
            ], 200);
        } catch (\Throwable $th) {
            return $this->errorMessage($th);
        }
    }

    public function logout(): JsonResponse
    {
        try {
            auth()->user()->tokens()->delete();
            return response()->json([
                'status' => true,
                'message' => 'Logout Success',
            ], 204);
        } catch (\Throwable $th) {
            return $this->errorMessage($th);
        }
    }
}
