<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Tạo templates thủ công</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Tạo templates kéo thả</a>
    </li>
  </ul>
  <div class="tab-content mt-5" id="myTabContent">
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        <div class="form-group row form-group-name">
            <label for="id-field-name" class="control-label col-sm-2">{{ __('Template Name') }}</label>
            <div class="col-sm-6">
                <input id="id-field-name" class="form-control" name="name" type="text" value="{{ old('name', $template->name ?? '') }}">
            </div>
        </div>
        
        @include('sendportal::templates.partials.editor')
        
        <div class="form-group row">
            <div class="offset-2 col-10">
                <a href="#" class="btn btn-md btn-secondary btn-preview">{{ __('Show Preview') }}</a>
                <button class="btn btn-primary btn-md" type="submit">{{ __('Save Template') }}</button>
            </div>
        </div>
    </div>
    <div class="tab-pane fade mt-5" id="profile" role="tabpanel" aria-labelledby="profile-tab">Kéo thả</div>
  </div>
