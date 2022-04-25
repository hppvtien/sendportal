@extends('sendportal::layouts.app')

@section('title', __('Thêm mới người nhận'))

@section('heading')
    {{ __('Người nhận') }}
@stop

@section('content')

    @component('sendportal::layouts.partials.card')
        @slot('cardHeader', __('Thêm người nhận mail'))

        @slot('cardBody')
            <form action="{{ route('sendportal.subscribers.store') }}" class="form-horizontal" method="POST">
                @csrf
                @include('sendportal::subscribers.partials.form')

                <x-sendportal.submit-button :label="__('Save')" />
            </form>
        @endSlot
    @endcomponent

@stop
