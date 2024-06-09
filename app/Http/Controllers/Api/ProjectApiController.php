<?php

namespace App\Http\Controllers\Api;

use App\Exception\RequestValidationException;
use App\Exception\ResourceNotFoundException;
use App\Exception\ResourceOwnershipConflict;
use App\Http\Controllers\Controller;
use App\Models\Project;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProjectApiController extends Controller
{

    public function getAll()
    {
        try {
            $projects = Project::all();

            return response()->json([
                'status' => true,
                'message' => 'List of all projects',
                'data' => $projects,
            ]);
        } catch (\Throwable $th) {
            return $this->errorMessage($th);
        }
    }

    public function getById(Request $request, $id): JsonResponse
    {
        try {
            $project = Project::find($id);

            if ($project)
                return response()->json([
                    'status' => true,
                    'message' => 'OK',
                    'data' => $project,
                ], 200);
            else
                throw new ResourceNotFoundException("Project not found");

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
                'name' => 'required',
                'department' => 'required',
                'status' => 'in:active,inactive',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator->errors());

            $project = Project::create([
                'name' => $request->name,
                'department' => $request->department,
                'start_date' => $request->start_date,
                'end_date' => $request->end_date,
                'status' => $request->status,
                'creator_id' => Auth::id(),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Project created successfully!',
                'data' => $project,
            ], 201);
        } catch (\Throwable $th) {
            if ($th instanceof RequestValidationException)
                return $this->validationFailedMessage($th);
            return $this->errorMessage($th);
        }
    }

    public function update(Request $request, $id): JsonResponse
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required',
                'department' => 'required',
                'status' => 'in:active,inactive',
            ]);

            if ($validator->fails())
                throw new RequestValidationException($validator->errors());

            $project = Project::find($id);

            if (!$project)
                throw new ResourceNotFoundException("Project not found");

            if ($project->creator_id !== Auth::id())
                throw new ResourceOwnershipConflict("Project not allowed to modify");

            $project->update([
                'name' => $request->name,
                'department' => $request->department,
                'start_date' => $request->start_date,
                'end_date' => $request->end_date,
                'status' => $request->status,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Project updated successfully!',
                'data' => $project,
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
            $project = Project::find($id);

            if (!$project)
                throw new ResourceNotFoundException("Project not found");

            if ($project->creator_id !== Auth::id())
                throw new ResourceOwnershipConflict("Project not allowed to delete");

            $project->delete();

            return response()->json([
                'status' => true,
                'message' => 'Project deleted successfully'
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
