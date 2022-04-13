<div class="main-wrapper col p-0 min-vh-100">

    <div class="main-content pl-4-half pr-4-half pb-4-half pt-4">

        <div class="alert-success"></div>
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
            </div>
        </div>
        
        <div class="card">
            <div class="card-table table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Chọn</th>
                            <th>Email</th>
                            <th>Name</th>
                            <th>Created</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($subscriber as $key => $subscriber)
                        <tr>
                            <td><input type="checkbox" name="subscriibers_id" value="{{ $subscriber->id }}" class="message-select"
                                    form="send-selected-form"></td>
                            <td>
                                <a href="javascript:;">
                                    {{ $subscriber->email }}
                                </a>
                            </td>
                            <td>{{ $subscriber->first_name }} {{ $subscriber->last_name }}</td>
                            <td><span title="2021-06-08 08:27:13">{{ $subscriber->created_at }}</span>
                            </td>
                        </tr>
                        @empty

                        @endforelse

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>