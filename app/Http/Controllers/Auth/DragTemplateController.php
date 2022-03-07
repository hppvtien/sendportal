<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\Request;

class DragTemplateController extends Controller
{
    public function create()
    {
        return view('drag_template.create');
    }
    public function store(Request $request)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $param = [
            'workspace_id'=>$user['current_workspace_id'],
            'name'=>$request->name,
            'content'=>$request->content,
            'type'=>1
        ];
        $templateId = \DB::table('sendportal_templates')->insertGetId(
            $param
        );
        if($templateId){
            return route('sendportal.templates.index');
        }
        
    }
    public function edit($id)
    {
        $template = \DB::table('sendportal_templates')->where('id',$id)->first();
        $data = [
            'template'=>$template
        ];
        return view('drag_template.edit',$data);
    }
    public function update(Request $request, int $id)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $param = [
            'name'=>$request->name,
            'content'=>$request->content,
        ];
        \DB::table('sendportal_templates')->where('id',$id)->update($param);
        return route('sendportal.templates.index');
    }
}
