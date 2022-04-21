@extends('sendportal::layouts.app')

@section('title', __('Trạng thái chiến dịch'))

@section('heading')
    {{ __('Trạng thái chiến dịch') }}
@stop

@section('content')



<div class="card">
    <div class="card-header card-header-accent">
        <div class="card-header-inner">
            {{ __('Chiến dịch của bạn hiện đang được xếp hàng đợi') }} <strong>{{ strtolower($campaign->status->name) }}</strong>
        </div>
    </div>
    <div class="card-body">
        @if ($campaign->queued)
            Chiến dịch của bạn đã được xếp hàng đợi và sẽ sớm được gửi đi.
        @elseif ($campaign->cancelled)
            Chiến dịch của bạn đã bị hệ thống từ chối.
        @else
            <i class="fas fa-cog fa-spin"></i>
            {{ $campaignStats[$campaign->id]['counts']['sent'] }} out of {{ $campaignStats[$campaign->id]['counts']['total'] }} messages sent.
        @endif
    </div>
</div>

@stop
