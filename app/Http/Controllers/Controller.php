<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function checkSizeUsed($workspace_id)
    {
        
        return $workspace_id;
    }
    public function checkQtyMailOnDate($workspace_id)
    {

        return $workspace_id;
    }
}
