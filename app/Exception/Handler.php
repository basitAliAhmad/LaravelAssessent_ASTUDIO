<?php

namespace App\Exception;

use Illuminate\Auth\AuthenticationException;
use \Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;


class Handler extends ExceptionHandler
{
    public function render($request, Throwable $exception)
    {
        if ($exception instanceof AuthenticationException) {
            return response()->json(["error"=>30001, "message"=>"authenticate failed"]);
        }
        return parent::render($request, $exception);
    }
}
