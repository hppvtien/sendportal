@extends('sendportal::layouts.app')

@section('title', __('Confirm Campaign'))

@section('heading')
    {{ __('Nội dung chiến dịch') }}: {{ $campaign->name }}
@stop

@section('content')

<div class="row">
    <div class="col-md-8">
        <div class="card mb-4">
            <div class="card-header card-header-accent">
                <div class="card-header-inner">
                    {{ __('Nội dung') }}
                </div>
            </div>
            <div class="card-body">
                <form class="form-horizontal">
                    <div class="row">
                        <label class="col-sm-2 col-form-label">{{ __('From') }}:</label>
                        <div class="col-sm-10">
                            <b>
                                <span class="form-control-plaintext">{{ $campaign->from_name . ' <' . $campaign->from_email . '>' }}</span>
                            </b>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">{{ __('Subject') }}:</label>
                        <div class="col-sm-10">
                            <b>
                                <span class="form-control-plaintext">{{ $campaign->subject }}</span>
                            </b>
                        </div>
                    </div>

                    <div style="border: 1px solid #ddd; height: 600px">
                        <iframe id="js-template-iframe" srcdoc="{{ $campaign->merged_content }}" class="embed-responsive-item" frameborder="0" style="height: 100%; width: 100%"></iframe>
                    </div>

                </form>
            </div>
        </div>

    </div>

    <div class="col-md-4">

        <form action="{{ route('sendportal.campaigns.test', $campaign->id) }}" method="POST">
            @csrf

            <div class="card mb-4">
                <div class="card-header">
                    {{ __('Kiểm tra mail') }}
                </div>
                <div class="card-body">

                    <div class="pb-2"><b>{{ __('NGƯỜI NHẬN') }}</b></div>
                    <div class="form-group row form-group-schedule">
                        <div class="col-sm-12">
                            <input name="recipient_email" id="test-email-recipient" type="email" class="form-control" placeholder="{{ __('Email người nhận') }}">
                        </div>
                    </div>

                    <div>
                        <button type="submit" class="btn btn-sm btn-secondary">{{ __('Kiểm tra mail') }}</button>
                    </div>
                </div>
            </div>
        </form>

        <form action="{{ route('sendportal.campaigns.send', $campaign->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="card mb-4">
                <div class="card-header">
                    {{ __('Chọn thông tin gửi') }}
                </div>
                <div class="card-body">

                    <div class="pb-2"><b>{{ __('NGƯỜI GỬI') }}</b></div>
                    <div class="form-group row form-group-recipients">
                        <div class="col-sm-12">
                            <select id="id-field-recipients" class="form-control" name="recipients">
                                <option value="send_to_all" {{ (old('recipients') ? old('recipients') == 'send_to_all' : $campaign->send_to_all) ? 'selected' : '' }}>
                                    {{ __('Tất cả người đăng ký') }} ({{ $subscriberCount }})
                                </option>
                                <option value="send_to_tags" {{ (old('recipients') ? old('recipients') == 'send_to_tags' : !$campaign->send_to_all) ? 'selected' : '' }}>
                                    {{ __('Chọn Tags') }}
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="tags-container {{ (old('recipients') ? old('recipients') == 'send_to_tags' : !$campaign->send_to_all) ? '' : 'hide' }}">
                        @forelse($tags as $tag)
                            <div class="checkbox">
                                <label>
                                    <input name="tags[]" type="checkbox" value="{{ $tag->id }}">
                                    {{ $tag->name }} ({{ $tag->activeSubscribers()->count() }} {{ __('Người đăng ký') }})
                                </label>
                            </div>
                        @empty
                            <div>{{ __('Không có tags nào được chọn') }}</div>
                        @endforelse
                    </div>

                    <div class="pb-2"><b>{{ __('LỊCH GỬI') }}</b></div>
                    <div class="form-group row form-group-schedule">
                        <div class="col-sm-12">
                            <select id="id-field-schedule" class="form-control" name="schedule">
                                <option value="now" {{ old('schedule') === 'now' || is_null($campaign->scheduled_at) ? 'selected' : '' }}>
                                    {{ __('Gửi ngay') }}
                                </option>
                                <option value="scheduled" {{ old('schedule') === 'now' || $campaign->scheduled_at ? 'selected' : '' }}>
                                    {{ __('Chọn thời gian gửi') }}
                                </option>
                            </select>
                        </div>
                    </div>

                    <input id="input-field-scheduled_at" class="form-control hide mb-3" name="scheduled_at" type="text" value="{{ $campaign->scheduled_at ?: now() }}">

                    <div class="pb-2"><b>{{ __('CÁCH GỬI') }}</b></div>
                    <div class="form-group row form-group-schedule">
                        <div class="col-sm-12">
                            <select id="id-field-behaviour" class="form-control" name="behaviour">
                                <option value="draft">{{ __('Bản nháp (gửi thủ công)') }}</option>
                                <option value="auto">{{ __('Gửi tự động') }}</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>

            <div>
                <a href="{{ route('sendportal.campaigns.index') }}" class="btn btn-light">{{ __('Cancel') }}</a>
                <button type="submit" class="btn btn-primary">{{ __('Gửi chiến dịch') }}</button>
            </div>

        </form>

    </div>


</div>

@stop

@push('css')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
@endpush

@push('js')
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        var target = $('.tags-container');
        $('#id-field-recipients').change(function() {
            if (this.value == 'send_to_all') {
                target.addClass('hide');
            } else {
                target.removeClass('hide');
            }
        });

        var element = $('#input-field-scheduled_at');
        $('#id-field-schedule').change(function() {
            if (this.value == 'now') {
                element.addClass('hide');
            } else {
                element.removeClass('hide');
            }
        });

        $('#input-field-scheduled_at').flatpickr({
            enableTime: true,
            time_24hr: true,
            dateFormat: "Y-m-d H:i",
        });
    </script>
@endpush
