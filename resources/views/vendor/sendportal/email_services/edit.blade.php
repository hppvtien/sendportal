@extends('sendportal::layouts.app')

@section('heading')
    {{ __('Dịch vụ mail') }}
@stop

@section('content')

    @component('sendportal::layouts.partials.card')
        @slot('cardHeader', __('Sửa dịch vụ mail'))

        @slot('cardBody')
            <form action="{{ route('sendportal.email_services.update', $emailService->id) }}" method="POST" class="form-horizontal">
                @csrf
                @method('PUT')
                <x-sendportal.text-field name="name" :label="__('Name')" :value="$emailService->name" />

                @include('sendportal::email_services.options.' . strtolower($emailServiceType->name), ['settings' => $emailService->settings])

                <x-sendportal.submit-button :label="__('Update')" />
            </form>
        @endSlot
    @endcomponent

@stop
