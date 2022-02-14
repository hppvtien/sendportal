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
            <!-- {{ route('sendportal.templates.store') }} -->
                
                @include('drag_template.partials.form')
        </div>
    </div>

@stop