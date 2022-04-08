@auth()
    @if (auth()->user()->ownsCurrentWorkspace())
        <li class="nav-item {{ request()->is('users*') ? 'active' : '' }}">
            <a class="nav-link" href="{{ route('users.index') }}">
                <i class="fa-fw fas fa-users mr-2"></i><span>{{ __('Quản lý người dùng') }}</span>
            </a>
        </li>
    @endif
@endauth
