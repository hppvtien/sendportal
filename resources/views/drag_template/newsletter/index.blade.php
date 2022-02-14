
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>GrapesJS Newsletter Editor</title>
    <link rel="stylesheet" href="https://unpkg.com/grapesjs@0.10.7/dist/css/grapes.min.css">

    <!-- <link rel="stylesheet" href="./style/material.css"> -->
    <link rel="stylesheet" href="{{ asset('newsletter/style/material.css') }}">

    <!-- <link rel="stylesheet" href="./style/tooltip.css"> -->
    <link rel="stylesheet" href="{{ asset('newsletter/style/tooltip.css') }}">

    <!-- <link rel="stylesheet" href="./style/toastr.min.css"> -->
    <link rel="stylesheet" href="{{ asset('newsletter/style/toastr.min.css') }}">

    <!-- <link rel="stylesheet" href="./dist/grapesjs-preset-newsletter.css"> -->
    <link rel="stylesheet" href="{{ asset('newsletter/dist/grapesjs-preset-newsletter.css') }}">

    <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://unpkg.com/grapesjs@0.10.7/dist/grapes.min.js"></script>
    <!-- <script src="./dist/grapesjs-preset-newsletter.min.js"></script> -->
    <script src="{{ asset('newsletter/dist/grapesjs-preset-newsletter.min.js') }}"></script>

    <!-- <script src="./js/toastr.min.js"></script> -->
    <!-- <script src="{{ asset('newsletter/js/toastr.min.js') }}"></script> -->

    <!-- <script src="./private/ajaxable.min.js"></script> -->
    <!-- <script src="./private/ajaxable.min.js"></script> -->
  </head>
  <!-- <style>
    body, html{ height: 100%; margin: 0;}
    .nl-link {
      color: inherit;
    }
    .info-link {
      text-decoration: none;
    }
    #info-cont {
      line-height: 17px;
    }
    .grapesjs-logo {
      display: block;
      height: 90px;
      margin: 0 auto;
      width: 90px;
    }
    .grapesjs-logo path{
      stroke: #eee !important;
      stroke-width: 8 !important;
    }

    #toast-container {
      font-size: 13px;
      font-weight: lighter;
    }
    #toast-container > div,
    #toast-container > div:hover{
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
      font-family: Helvetica, sans-serif;
    }
    #toast-container > div{
      opacity: 0.95;
    }
  </style> -->
  <body>
    <div id="gjs" style="height:0px; overflow:hidden">
    </div>
    <script type="text/javascript">
      var host = 'http://artf.github.io/grapesjs/';
      var images = [
        host + 'img/grapesjs-logo.png',
        host + 'img/tmp-blocks.jpg',
        host + 'img/tmp-tgl-images.jpg',
        host + 'img/tmp-send-test.jpg',
        host + 'img/tmp-devices.jpg',
      ];

      // Set up GrapesJS editor with the Newsletter plugin
      var editor = grapesjs.init({
        height: '100%',
        //noticeOnUnload: 0,
        storageManager:{
          autoload: 0,
        },
        assetManager: {
          assets: images,
          upload: 0,
          uploadText: 'Uploading is not available in this demo',
        },
        container : '#gjs',
        fromElement: true,
        plugins: ['gjs-preset-newsletter'],
        pluginsOpts: {
          'gjs-preset-newsletter': {
            modalLabelImport: 'Paste all your code here below and click import',
            modalLabelExport: 'Copy the code and use it wherever you want',
            codeViewerTheme: 'material',
            //defaultTemplate: templateImport,
            importPlaceholder: '<table class="table"><tr><td class="cell">Hello world!</td></tr></table>',
            cellStyle: {
              'font-size': '12px',
              'font-weight': 300,
              'vertical-align': 'top',
              color: 'rgb(111, 119, 125)',
              margin: 0,
              padding: 0,
            }
          }
        }
      });


      // Let's add in this demo the possibility to test our newsletters
      var mdlClass = 'gjs-mdl-dialog-sm';
      var pnm = editor.Panels;
      var cmdm = editor.Commands;
      var testContainer = document.getElementById("test-form");
      var md = editor.Modal;

      pnm.addButton('options', {
        id: 'send-test',
        className: 'fa fa-paper-plane',
        command: 'send-test',
        attributes: {
          'title': 'Test Newsletter',
          'data-tooltip-pos': 'bottom',
        },
      });

      //fa fa-refresh
      var statusFormElC = document.querySelector('.form-status');
      var statusFormEl = document.querySelector('.form-status i');
      

      // Add info command
      var infoContainer = document.getElementById("info-cont");
      cmdm.add('open-info', {
        run(editor, sender) {
          sender.set('active', 0);
          var mdlDialog = document.querySelector('.gjs-mdl-dialog');
          mdlDialog.className += ' ' + mdlClass;
          infoContainer.style.display = 'block';
          md.setTitle('About this demo');
          md.setContent('');
          md.setContent(infoContainer);
          md.open();
          md.getModel().once('change:open', function() {
            mdlDialog.className = mdlDialog.className.replace(mdlClass, '');
          })
        }
      });
      pnm.addButton('options', {
        id: 'view-info',
        className: 'fa fa-question-circle',
        command: 'open-info',
        attributes: {
          'title': 'About',
          'data-tooltip-pos': 'bottom',
        },
      });
      $(document).ready(function () {

        // Beautify tooltips
        $('*[title]').each(function () {
          var el = $(this);
          var title = el.attr('title').trim();
          if(!title)
            return;
          el.attr('data-tooltip', el.attr('title'));
          el.attr('title', '');
        });

      });
    </script>
  </body>
</html>
