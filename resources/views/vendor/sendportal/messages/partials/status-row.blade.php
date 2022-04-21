@if ($message->bounced_at)
    <div class="badge badge-danger">{{ __('Đã hủy') }}</div>
@elseif ($message->unsubscribed_at)
    <div class="badge badge-danger">{{ __('Hủy đăng ký') }}</div>
@elseif ($message->clicked_at)
    <div class="badge badge-success">{{ __('Đã click') }}</div>
@elseif ($message->opened_at)
    <div class="badge badge-success">{{ __('Đã đọc') }}</div>
@elseif ($message->delivered_at)
    <div class="badge badge-info">{{ __('Hoàn thành') }}</div>
@elseif ($message->sent_at)
    <div class="badge badge-light">{{ __('Đã gửi') }}</div>
@else
    <div class="badge badge-light">{{ __('Chưa gửi') }}</div>
@endif
