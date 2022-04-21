<ul class="nav nav-pills mb-4">
    <li class="nav-item">
        <a class="nav-link {{ request()->routeIs('sendportal.campaigns.index') ? 'active'  : '' }}"
           href="{{ route('sendportal.campaigns.index') }}">{{ __('Chưa gửi') }}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link {{ request()->routeIs('sendportal.campaigns.sent') ? 'active'  : '' }}"
           href="{{ route('sendportal.campaigns.sent') }}">{{ __('Đã gửi') }}</a>
    </li>
</ul>
