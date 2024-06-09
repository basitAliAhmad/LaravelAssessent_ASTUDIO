<?php

namespace App\Http\Controllers\Api;

use App\Exception\RequestValidationException;
use App\Exception\ResourceNotFoundException;
use App\Exception\ResourceOwnershipConflict;
use App\Http\Controllers\Controller;
use App\Models\TimeSheet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TimeSheetApiController extends Controller
{

    public function getAll(Request $request)
    {
        try {
            $time_logs = TimeSheet::where('user_id', Auth::id())->get();

            return response()->json([
                'status' => true,
                'message' => 'OK',
                'data' => $time_logs
            ], 200);
        } catch (\Throwable $th) {
            return $this->errorMessage($th);
        }
    }

    public function getbyId(Request $request, $id)
    {
        try {
            $time_log = TimeSheet::find($id);

            if (!$time_log || $time_log->user_id != Auth::id())
                throw new ResourceNotFoundException("Time sheet record not found for you");

            return response()->json([
                'status' => true,
                'message' => 'OK',
                'data' => $time_log
            ]);

        } catch (\Throwable $th) {
            if ($th instanceof ResourceNotFoundException)
                return $this->resourceNotFoundMessage($th);
            return $this->errorMessage($th);
        }
    }

    public function create(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'task_name' => 'required',
                'project_id' => 'required',
                'hours' => 'required|numeric|min:0',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator->errors());

            $time_log = TimeSheet::create([
                'task_name' => $request->task_name,
                'project_id' => $request->project_id,
                'user_id' => Auth::id(),
                'date_logged' => $request->date_logged,
                'hours' => $request->hours,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'OK',
                'data' => $time_log
            ], 201);

        } catch (\Throwable $throwable) {
            if  ($throwable instanceof RequestValidationException)
                return $this->validationFailedMessage($throwable);
            return $this->errorMessage($throwable);
        }
    }

    public function update(Request $request, $id)
    {
        try {

            $validator = Validator::make($request->all(), [
                'task_name' => 'required',
                'project_id' => 'required',
                'hours' => 'required|numeric|min:0',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator->errors());

            $time_log = TimeSheet::find($id);

            if (!$time_log)
                throw new ResourceNotFoundException("Time sheet record not found");

            if ($time_log->user_id != Auth::id())
                throw new ResourceOwnershipConflict("Time sheet record not belong to you");

            $time_log->update([
                'task_name' => $request->task_name,
                'project_id' => $request->project_id,
                'user_id' => Auth::user()->id,
                'date_logged' => $request->date_logged,
                'hours' => $request->hours,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'OK',
                'data' => $time_log
            ], 200);

        } catch (\Throwable $th) {
            if ($th instanceof RequestValidationException)
                return $this->validationFailedMessage($th);
            else if ($th instanceof ResourceNotFoundException)
                return $this->resourceNotFoundMessage($th);
            else if ($th instanceof ResourceOwnershipConflict)
                return $this->resourceOwnershipConflict($th);
            return $this->errorMessage($th);
        }
    }

    public function delete(Request $request, $id)
    {
        try {
            $time_log = TimeSheet::find($id);

            if (!$time_log)
                throw new ResourceNotFoundException("Time sheet record not found");

            if ($time_log->user_id !== Auth::id())
                throw new ResourceOwnershipConflict("Time sheet record not belong to you");

            $time_log->delete();

            return response()->json([
                'status' => true,
                'message' => 'OK',
            ], 204);

        } catch (\Throwable $th) {
            if ($th instanceof ResourceNotFoundException)
                return $this->resourceNotFoundMessage($th);
            else if ($th instanceof ResourceOwnershipConflict)
                return $this->resourceOwnershipConflict($th);
            return $this->errorMessage($th);
        }
    }
}
