<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProfileUpdateRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\HeaderBag;

class DragTemplateController extends Controller
{
    public function create(Request $request)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $template_limit_use = $user->template_limit_use;
        $current_workspace_id = $user->current_workspace_id;
        $template_used = \DB::table('sendportal_templates')->where('workspace_id',$current_workspace_id)->get()->count();
        $viewData=[
            'template_limit_use'=>$template_limit_use,
            'template_used'=>$template_used,
        ];
        return view('drag_template.create',$viewData);
    }
    public function store(Request $request)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $template_limit_use = $user->template_limit_use;
        $current_workspace_id = $user->current_workspace_id;
        $template_used = \DB::table('sendportal_templates')->where('workspace_id',$current_workspace_id)->get()->count();
        $param = [
            'workspace_id'=>$user['current_workspace_id'],
            'name'=>$request->name,
            'content'=>$request->content,
            'type'=>1,
            'created_at'=>Carbon::now(),
            'size_template'=>strlen(json_encode($request->content))
        ];
        if($template_limit_use < $template_used){
            $templateId = \DB::table('sendportal_templates')->insertGetId(
                $param
            );
           
        }
        return route('sendportal.templates.index');
       
        
        
    }
    public function edit(Request $request, $id)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $template_limit_use = $user->template_limit_use;
        $current_workspace_id = $user->current_workspace_id;
        $template_used = \DB::table('sendportal_templates')->where('workspace_id',$current_workspace_id)->get()->count();
       
        $template = \DB::table('sendportal_templates')->where('id',$id)->first();
        $viewData=[
            'template_limit_use'=>$template_limit_use,
            'template_used'=>$template_used,
            'template'=>$template
        ];
        return view('drag_template.edit',$viewData);
    }
    public function update(Request $request, int $id)
    {
        $user = $request->user()->load('workspaces', 'invitations.workspace');
        $param = [
            'name'=>$request->name,
            'content'=>$request->content,
            'updated_at'=>Carbon::now(),
            'size_template'=>strlen(json_encode($request->content))
        ];
        \DB::table('sendportal_templates')->where('id',$id)->update($param);
        return route('sendportal.templates.index');
    }
}
