<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
        <a href="{{ route('sendportal.templates.create') }}" class="nav-link bg-primary text-white">Tạo templates thủ công</a>
    </li>

</ul>

<div class="tab-content mt-5" id="">
<p id="name_err" class="text-danger"></p> 
<p id="content_err" class="text-danger"></p> 
    <div class="tab-pane fade show active">
        <div class="form-group row form-group-name">
            <label for="id-field-name" class="control-label col-sm-2">{{ __('Template Name') }}</label>
            <div class="col-sm-6">
                <input id="id-field-name" class="form-control" name="name" type="text" value="{{ old('name', $template->name ?? '') }}">
            </div>
            <input id="id-field-content" class="form-control" name="content" type="hidden" value="{{ old('content', $template->content ?? '') }}">
        </div>

        @include('drag_template.partials.editor')
    </div>

    <div class="form-group row">
        <div class="offset-2 col-10">   
            <button class="btn btn-primary btn-md" id="save-template" data-url="{{ route('drag_template.post.drag_create') }}" data-id="{{ old('id',$template->id ?? '') }}" type="button">{{ __('Lưu giao diện mail') }}</button>
        </div>
    </div>
</div>
