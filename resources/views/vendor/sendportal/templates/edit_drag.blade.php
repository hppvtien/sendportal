@extends('sendportal::layouts.app')

@section('title', __("Templates"))

@section('heading')

@stop

@section('content')
<p class="d-none" id="mypage_content">{{ $template->content }}</p>
    <div class="card">
        <div class="card-header">
            {{ __('Edit Template') }}
        </div>
        <div class="card-body">
            <form action="{{ route('drag_create.post.drag_update', $template->id) }}" method="POST" class="form-horizontal">
                @csrf
                @include('sendportal::templates.partials.form_drag')
            </form>
        </div>
    </div>

  

@stop
