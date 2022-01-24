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

        return redirect()->back()->with('success', __('Your profile was updated successfully!'));
    }

    public function edit(): View
    {
        return view('profile.edit');
    }

    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->update($request->validated());

        return redirect()->back()->with('success', __('Your profile was updated successfully!'));
    }
}
