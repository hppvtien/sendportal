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
                @if ($template_used < $template_limit_use)
                    @include('drag_template.partials.form')
                @else
                    <p>Tài khoản của bạn chỉ được tạo tối đa <span class="text-danger">{{ $template_used }} Template.</span></p>
                    <p>Bạn hãy liên hệ với quản trị để được hỗ trợ.</p>
                @endif           
                
        </div>
    </div>

@stop