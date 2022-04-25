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
                                <span class="form-control-plaintext">{{ $campaign->from_name . ' <' . $campaign->
                                        from_email . '>' }}</span>
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
        @if ($mail_used_on_month[0]['count'] < $mail_limit_month) <form action="{{ route('sendportal.campaigns.send', $campaign->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="card mb-4">
                <div class="card-header">
                    {{ __('Chọn thông tin gửi') }}
                </div>
                <div class="card-body">

                    <div class="pb-2">
                        <b>{{ __('NGƯỜI GỬI') }}</b>
                        <p class="text-primary pt-3"><b>Số mail đã gửi trong ngày:</b> <span class="text-success">{{
                                $mail_used_on_day }}</span>/<span class="text-danger">{{ $mail_limit_day }}</span></p>
                        <p class="text-primary"><b>Số mail đã gửi trong tháng:</b> <span class="text-success">
                            {{ $mail_used_on_month[0]['count'] }}
                            </span>/ <span class="text-danger">
                                {{ $mail_limit_month }}</span></p>
                    </div>
                    <div class="form-group row form-group-recipients">
                        <div class="col-sm-12">
                            @if ($mail_used_on_month[0]['count'] < $mail_limit_month) <select id="id-field-recipients" class="form-control" name="recipients">
                                @if ($subscriberCount < ($mail_limit_day - $mail_used_on_day)) <option value="send_to_all" {{ (old('recipients') ? old('recipients')=='send_to_all' :
                                    $campaign->send_to_all) ? 'selected' : '' }}>
                                    {{ __('Tất cả người đăng ký') }} ({{ $subscriberCount }})
                                    </option>
                                    @else
                                    @endif
                                    <option value="send_to_check" {{ (old('recipients') ?
                                        old('recipients')=='send_to_check' : !$campaign->send_to_all) ? 'selected' : ''
                                        }}>
                                        {{ __('Chọn trong danh sách') }}
                                    </option>
                                    </select>
                                    @else
                                    @endif

                        </div>
                    </div>
                    <div class="list-send text-center my-2">

                    </div>
                    <div class="check-container text-center my-2">
                        <button type="button" id="show-form-check-user" data-toggle="modal" data-qty-sent="{{ $mail_limit_day - $mail_used_on_day }}" data-target=".bd-example-modal-lg" data-url="{{ route('sendportal.campaigns.getSubscriber',Sendportal\Base\Facades\Sendportal::currentWorkspaceId()) }}" workspace-id="{{ Sendportal\Base\Facades\Sendportal::currentWorkspaceId() }}" class="btn btn-secondary">{{ __('Chọn mail để Gửi') }}</button>
                    </div>
                    <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Danh sách nhận mail</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" id="subcribers-tag">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn btn-primary" id="create-list-sub" data-url="{{ route('sendportal.campaigns.createListSub',Sendportal\Base\Facades\Sendportal::currentWorkspaceId()) }}">Tạo
                                        danh sách gửi</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pb-2"><b>{{ __('LỊCH GỬI') }}</b></div>
                    <div class="form-group row form-group-schedule">
                        <div class="col-sm-12">
                            <select id="id-field-schedule" class="form-control" name="schedule">
                                <option value="now" {{ old('schedule')==='now' || is_null($campaign->scheduled_at) ?
                                    'selected' : '' }}>
                                    {{ __('Gửi ngay') }}
                                </option>
                                <option value="scheduled" {{ old('schedule')==='now' || $campaign->scheduled_at ?
                                    'selected' : '' }}>
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
            @else
            <div class="card mb-4">
                <div class="card-header">
                    Thông tin tài khoản
                </div>
                <div class="card-body">

                    <div class="pb-2">
                        <b>NGƯỜI GỬI</b>
                        <p class="text-danger pt-3"><b>Tài khoản của bạn đã dùng hết dung lượng</b></p>
                    </div>
                </div>
            </div>
            @endif
    </div>
</div>

@stop

@push('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
@endpush

@push('js')
<script>
    var EDIT_URL = '{{ route("sendportal.campaigns.editSubscriber",Sendportal\Base\Facades\Sendportal::currentWorkspaceId()) }}'
</script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    var target = $('.tags-container');
    var target_check = $('.check-container');
    $('#id-field-recipients').change(function() {
        if (this.value == 'send_to_all') {
            target_check.addClass('hide');
        } else {
            target_check.removeClass('hide');
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
    $('#show-form-check-user').click(function() {
        var workspace_id = $(this).attr('workspace-id');
        var data_url = $(this).attr('data-url');
        $.ajax({
            url: data_url,
            type: "get",
            dataType: "text",
            data: {
                workspace_id: workspace_id,
            },
            success: function(result) {
                $('#subcribers-tag').html(result);
            },
            error: function(result) {
                console.log("Loiiiiiiiiiiiiiii");
            }
        });
    });
    $('#create-list-sub').click(function() {
        var workspace_id = $('#show-form-check-user').attr('workspace-id');
        var qty_sent_mail = $('#show-form-check-user').attr('data-qty-sent');
        var subscriibers_id = [];
        $("input[name=subscriibers_id]:checked").each(function(i) {
            subscriibers_id.push($(this).val());
        });
        var data_url = $(this).attr('data-url');
        var getSubscriber_length = subscriibers_id.length;
        if (getSubscriber_length > qty_sent_mail) {
            $('.alert-success').html('<h5 class="text-danger p-2 text-center">Bạn có thể gửi được: ' + qty_sent_mail + ' email trong ngày</h5>');
        } else {
            $.ajax({
                url: data_url,
                type: "get",
                dataType: "text",
                data: {
                    subscriibers_id: subscriibers_id,
                    workspace_id: workspace_id,
                },
                success: function(result) {
                    $('.alert-success').html('<h5 class="text-success p-2 text-center">Bạn đã tạo thành công danh sách người nhận mail</h5>');
                    $('#create-list-sub').hide();
                    var obj = jQuery.parseJSON(result);
                    var html_ap = '<a href="javascript:;" data-toggle="modal" data-target=".bd-example-modal-lg" class="edit-list-sub" tagID="' + obj.id + '">' + obj.name + '</a><input name="tags[]" type="hidden" value="' + obj.id + '">';
                    $('.list-send').html(html_ap)
                },
                error: function(result) {
                    console.log("Loiiiiiiiiiiiiiii");
                }
            });
        }
    });
    $(document).ready(function() {
        $('.list-send').click(function() {
            var tagid = $('.edit-list-sub').attr('tagid');
            $.ajax({
                url: EDIT_URL,
                type: "get",
                dataType: "text",
                data: {
                    tagid: tagid,
                },
                success: function(result) {
                    $('#subcribers-tag').html(result);
                    console.log(result);
                },
                error: function(result) {
                    console.log("Loiiiiiiiiiiiiiii");
                }
            });
        });
    });
</script>
@endpush