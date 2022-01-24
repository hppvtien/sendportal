@push('css')
<!-- <link href="{{ asset('/vendor/contentbox5/assets/minimalist-blocks/content.css') }}" rel="stylesheet" type="text/css" /> Snippets css include (contains a simple css for content blocks/snippets) -->
<link href="{{ asset('/vendor/contentbox5/box/box-flex.css') }}" rel="stylesheet" type="text/css" /> <!-- Box Framework css include (contains a simple css for sections) -->

<!-- Required css for editing (not needed in production) -->
<link href="{{ asset('/vendor/contentbox5/contentbuilder/contentbuilder.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('/vendor/contentbox5/contentbox/contentbox.css') }}" rel="stylesheet" type="text/css" />
@endpush()

<div class="form-group row form-group-content template-content no-gutters">
    <label for="id-field-content" class="control-label col-sm-2">{{ __('Content') }}</label>
    <div class="col-sm-10 bg-dark overflow-auto" name="content">
        <div class="is-wrapper"></div>

    </div>
</div>

@push('js')
<!-- Slider feature (by setting slider: 'glide') -->
<link href="{{ asset('/vendor/contentbox5/assets/scripts/glide/css/glide.core.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('/vendor/contentbox5/assets/scripts/glide/css/glide.theme.css') }}" rel="stylesheet" type="text/css" />
<script src="{{ asset('/vendor/contentbox5/assets/scripts/glide.js') }}" type="text/javascript"></script>

<!-- Required js for editing (not needed in production) -->
<script src="{{ asset('/vendor/contentbox5/contentbuilder/lang/en.js') }}" type="text/javascript"></script>
<script src="{{ asset('/vendor/contentbox5/contentbuilder/contentbuilder.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('/vendor/contentbox5/contentbox/contentbox.min.js') }}" type="text/javascript"></script>
<script type="text/javascript">
    var timeoutId; //Used for Auto Save

    //Enable editing
    const builder = new ContentBox({
        coverImageHandler: 'savecover.php',
        /* for uploading box background */
        mediaHandler: 'savemedia.php',
        /* for uploading image (or video) */
        videoHandler: 'savemedia.php',
        /* for uploading video */
        imageSelect: 'assets.html',
        fileSelect: 'assets.html',
        videoSelect: 'assets.html',

        slider: 'glide',

        onChange: function() {
            //Auto Save
            clearTimeout(timeoutId);
            timeoutId = setTimeout(function() {
                save();
            }, 1000);
        },

    });

    // Load saved content. In this example we use browser's localStorage.
    let html = localStorage.getItem('mypage') || '';
    let mainCss = localStorage.getItem('maincss') || '';
    let sectionCss = localStorage.getItem('sectioncss') || '';
    if (html !== '') {
        builder.loadStyles(mainCss, sectionCss); // Load styles
        builder.loadHtml(html); // Load html
    }

    // Example of adding buttons on the sidebar
    builder.addButton({
        'pos': 2, // button position
        'title': 'Undo', // title
        'html': '<svg class="is-icon-flex" style="width:14px;height:14px;"><use xlink:href="#ion-ios-undo"></use></svg>', // icon
        'onClick': () => {
            builder.undo();
        }
    });
    builder.addButton({
        'pos': 3, // button position
        'title': 'Redo', // title
        'html': '<svg class="is-icon-flex" style="width:14px;height:14px;"><use xlink:href="#ion-ios-redo"></use></svg>', // icon
        'onClick': () => {
            builder.redo();
        }
    });
    builder.addButton({
        'pos': 5, // button position
        'title': 'Preview', // title
        'html': '<svg class="is-icon-flex" style="width:16px;height:16px;"><use xlink:href="#ion-eye"></use></svg>', // icon
        'onClick': () => {
            var html = builder.html();
            alert(html);
            localStorage.setItem('preview-html', html);
            var mainCss = builder.mainCss();
            alert(mainCss);
            localStorage.setItem('preview-maincss', mainCss);
            var sectionCss = builder.sectionCss();
            localStorage.setItem('preview-sectioncss', sectionCss);

            //window.open('preview.html', '_blank').focus();
        }
    });
    builder.addButton({
        'pos': 6,
        'title': 'Save',
        'html': '<i class="icon ion-android-done-all is-icon-flex" style="width:16px;height:16px;"> </i>', // icon
        'onClick': () => {
            alert('aaaaaaaaaaaaaaaaaaaaaa');
        }
    });
    /*builder.addButton({ 
        'pos': 7, // button position
        'title': 'Destroy', // title
        'html': '<svg class="is-icon-flex" style="width:14px;height:14px;"><use xlink:href="#ion-ios-save"></use></svg>', // icon
        'onClick': ()=>{
            builder.destroy();
        }
    });*/

    function save() {

        //Save all base64 images into files on the server
        //saveimage.php
        builder.saveImages('saveimage.php', function() {

            //Save Content
            let html = builder.html();
            localStorage.setItem('mypage', html); //In this example, save the content into browser's local storage.

            //Save Styles (needed by content)
            let mainCss = builder.mainCss(); //mainCss() returns css that defines typography style for the body/entire page.
            localStorage.setItem('maincss', mainCss); //In this example, save the styles into browser's local storage.

            let sectionCss = builder.sectionCss(); //sectionCss returns css that define typography styles for certan section(s) on the page
            localStorage.setItem('sectioncss', sectionCss); //In this example, save the styles into browser's local storage.

        });

    }
</script>

<!-- Required js for production -->
<script src="{{ asset('/vendor/contentbox5/box/box-flex.js') }}" type="text/javascript"></script> <!-- Box Framework js include -->


<!-- Optional: if you want to add smooth scrolling -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/smoothscroll/1.4.10/SmoothScroll.min.js" type="text/javascript"></script>
<script>
    SmoothScroll({
        frameRate: 150,
        animationTime: 800,
        stepSize: 120,
        pulseAlgorithm: 1,
        pulseScale: 4,
        pulseNormalize: 1,
        accelerationDelta: 300,
        accelerationMax: 2,
        keyboardSupport: 1,
        arrowScroll: 50,
        fixedBackground: 0
    });
</script>
@endpush()