@extends('sendportal::layouts.app')

@section('title', __('Email Templates'))

@section('heading')
    {{ __('Email Templates') }}
@endsection

@section('content')

    @component('sendportal::layouts.partials.actions')
        @slot('right')
            <a class="btn btn-primary btn-md btn-flat" href="{{ route('drag_template.get.drag_create') }}">
                <i class="fa fa-plus mr-1"></i> {{ __('Tạo Template') }}
            </a>
        @endslot
    @endcomponent

    @include('sendportal::templates.partials.grid')

@endsection
