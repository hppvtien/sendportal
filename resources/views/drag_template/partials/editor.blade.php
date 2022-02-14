@push('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.52.2/codemirror.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.52.2/theme/monokai.min.css">
<style>
    .CodeMirror {
        height: 600px;
    }

    .template-preview {
        height: 600px;
    }
</style>
@endpush

<div class="form-group row template-preview">
    <div class="col-12">
        <div class="border border-light h-100">
            @include('drag_template.newsletter.index1')
        </div>
    </div>
</div>


@push('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.52.2/codemirror.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.52.2/mode/xml/xml.min.js"></script>

<script>
    $(document).ready(function() {
        var codeMirror = CodeMirror.fromTextArea(document.getElementById('id-field-content'), {
            lineNumbers: true,
            lineWrapping: true,
            mode: 'xml',
            theme: 'monokai',
        });

        $('.btn-preview').click(function(e) {
            e.preventDefault();

            var elContent = $('.template-preview');
            var elPreview = $('.template-content');
            var elButton = $('.btn-preview');

            if (elContent.hasClass('d-none')) {
                $('.template-preview iframe').attr('srcdoc', codeMirror.getValue());
                elContent.removeClass('d-none');
                elPreview.addClass('d-none');
                elButton.text('Show Design');
            } else {
                elContent.addClass('d-none');
                elPreview.removeClass('d-none');
                elButton.text('Show Preview');
            }
        });
    });
    
</script>
<script>
    $("#save-template").on("click", function() {
    var data_url = $(this).attr('data-url');
    var content = $("#wrapper");
    var name = $("input[name=name]").val();

    $.ajax({
        url: data_url,
        type: "post",
        dataType: "text",
        data: {
            content: content,
            name: name
        },
        success: function(result) {
            console.log(result);
            // $("#des-campaign").html(result);
            window.location.href = result;
        },
        error: function(result) {
            console.log("error");
            // console.log(result);
        }
    });
});
</script>
@endpush