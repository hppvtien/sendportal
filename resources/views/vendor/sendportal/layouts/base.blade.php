<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    @include('sendportal::layouts.partials.favicons')

    <title>
        @hasSection('title')
            @yield('title') |
        @endif
        {{ config('app.name') }}
    </title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="{{ asset(mix('app.css', 'vendor/sendportal')) }}" rel="stylesheet">

    @stack('css')

</head>
<body>

@yield('htmlBody')

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>
    $('.sidebar-toggle').click(function (e) {
        e.preventDefault();
        toggleElements();
    });

    function toggleElements() {
        $('.sidebar').toggleClass('d-none');
    }
</script>
<script>
    $.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": $('input[name="_token"]').val()
    }
});
$("#btn-savedrag").on("click", function() {
    var data_url = $(this).attr('data-url');
    var mypage = localStorage.getItem("mypage");
    var name = $("input[name=name]").val();
    var SS_deltaBuffer = localStorage.getItem("SS_deltaBuffer");
    var maincss = localStorage.getItem("maincss");
    var sectioncss = localStorage.getItem("sectioncss");
    $.ajax({
        url: data_url,
        type: "post",
        dataType: "text",
        data: {
            name: name,
            mypage: mypage,
            SS_deltaBuffer: SS_deltaBuffer,
            maincss: maincss,
            sectioncss: sectioncss
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

<script>
        $( document ).ready(function() {
            var content_page = $("#mypage_content").text();
            if(content_page){
            localStorage.setItem('mypage', $("#mypage_content").text());
            localStorage.setItem('maincss', '');
            localStorage.setItem('SS_deltaBuffer', '120,120,120');
            localStorage.setItem("sectioncss", '<link data-name="contentstyle" data-class="type-opensans" href="/vendor/contentbox5/assets/styles/type-opensans.css" rel="stylesheet">');
            localStorage.getItem("mypage");
            localStorage.getItem("sectioncss");
            localStorage.getItem("SS_deltaBuffer");
            localStorage.getItem("maincss");
            } else {
                
            localStorage.removeItem('mypage');
            localStorage.removeItem('maincss');
            localStorage.removeItem('SS_deltaBuffer');
            localStorage.removeItem("sectioncss");
            }
            
        });
          
    </script>
@stack('js')

</body>
</html>
