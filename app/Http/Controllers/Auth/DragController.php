<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\Request;

class DragController extends Controller
{
    public function create(): View
    {
        return view('sendportal::templates.drag_create');
    }
    public function store(Request $request)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $param = [
            'workspace_id'=>$user['current_workspace_id'],
            'name'=>$request->name,
            'content'=>$request->mypage,
            'type'=>1
        ];
        $templateId = \DB::table('sendportal_templates')->insertGetId(
            $param
        );
        if($templateId){

            return route('sendportal.templates.index');
        }
        
    }
    public function update(Request $request, int $id)
    {
        $param = [
            'name'=>$request->name,
            'content'=>$request->mypage,
        ];
        \DB::table('sendportal_templates')->where('id',$id)->update($param);
      

        return route('sendportal.templates.index');
    }
}
