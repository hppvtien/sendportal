@extends('sendportal::layouts.app')

@section('title', __('New Template'))

@section('heading')
{{ __('Templates') }}
@stop

@section('content')

<div class="card">
    <div class="card-header">
        {{ __('Create Template') }}
    </div>
    <div class="card-body">
        <form action="{{ route('sendportal.templates.store') }}" method="POST" class="form-horizontal">
            @csrf
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a href="{{ route('sendportal.templates.create') }}" class="nav-link">Tạo templates thủ công</a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('drag_create.get.drag_create') }}" class="nav-link bg-primary text-white">Tạo templates kéo thả</a>
                </li>
            </ul>
            <div class="tab-content mt-5" id="">
                <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="home-tab">
                    <div class="form-group row form-group-name">
                        <label for="id-field-name" class="control-label col-sm-2">{{ __('Template Name') }}</label>
                        <div class="col-sm-6">
                            <input id="id-field-name" class="form-control" name="name" type="text" value="{{ old('name', $template->name ?? '') }}">
                        </div>
                    </div>
                    @include('sendportal::contentbox5.index')
                </div>

                <div class="form-group row">
                    <div class="offset-2 col-10">
                        <a href="#" class="btn btn-md btn-secondary btn-preview">{{ __('Show Preview') }}</a>
                        <button class="btn btn-primary btn-md" type="button" data-url="{{ route('drag_create.post.drag_create') }}" id="btn-savedrag">{{ __('Save Template') }}</button>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>

@stop