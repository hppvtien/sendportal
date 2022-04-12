<div class="main-wrapper col p-0 min-vh-100">

    <div class="main-content pl-4-half pr-4-half pb-4-half pt-4">


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
        <div class="d-flex flex-column flex-md-row justify-content-between mb-3">
            <div>
                <form action="http://127.0.0.1:8000/subscribers" method="GET" class="form-inline mb-3 mb-md-0">
                    <input class="form-control form-control-sm" name="name" type="text" value=""
                        placeholder="Search...">

                    <div class="mr-2">
                        <select name="status" class="form-control form-control-sm">
                            <option value="all">All</option>
                            <option value="subscribed" selected="">Subscribed</option>
                            <option value="unsubscribed">Unsubscribed</option>
                        </select>
                    </div>

                    <button type="button" class="btn btn-light btn-md">Search</button>

                    <a href="javascript:;" class="btn btn-md btn-light">Clear</a>
                </form>
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
                            <td><input type="checkbox" name="subscriibers_id[]" value="{{ $subscriber->id }}" class="message-select"
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

        <div class="row mb-4">
            <div class="col-sm-6">

            </div>
            <div class="col-sm-6 text-right pt-1">
                Showing 3 of 3 items
            </div>
        </div>

     

    </div>

</div>