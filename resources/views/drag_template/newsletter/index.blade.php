<body>
  @push('css')
  <style>
    .gjs-grabbing {
      overflow: auto !important;
    }
  </style>
  <link rel="stylesheet" href="{{ asset('newsletter/dist/grapes.min.css') }}">
  <link rel="stylesheet" href="{{ asset('newsletter/style/material.css') }}">
  <link rel="stylesheet" href="{{ asset('newsletter/dist/grapesjs-preset-newsletter.css') }}">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  @endpush

  <div id="gjs" style="height:0px; overflow:unset">
  {!! old('content', $template->content ?? '') !!}
    <style>
      .gjs-grabbing {
        overflow: auto !important;
      }

      .link {
        color: rgb(217, 131, 166);
      }

      .row {
        vertical-align: top;
      }

      .main-body {
        min-height: 150px;
        padding: 5px;
        width: 100%;
        height: 100%;
        background-color: rgb(234, 236, 237);
      }

      .c926 {
        color: rgb(158, 83, 129);
        width: 100%;
        font-size: 50px;
      }

      .cell.c849 {
        width: 11%;
      }

      .gjs-block {
        padding: 4px !important;
      }

      .c1144 {
        padding: 10px;
        font-size: 17px;
        font-weight: 300;
      }

      .card {
        min-height: 150px;
        padding: 5px;
        margin-bottom: 20px;
        height: 0px;
      }

      .card-cell {
        background-color: rgb(255, 255, 255);
        overflow: hidden;
        border-radius: 3px;
        padding: 0;
        text-align: center;
      }

      .card.sector {
        background-color: rgb(255, 255, 255);
        border-radius: 3px;
        border-collapse: separate;
      }

      .c1271 {
        width: 100%;
        margin: 0 0 15px 0;
        font-size: 50px;
        color: rgb(120, 197, 214);
        line-height: 250px;
        text-align: center;
      }

      .table100 {
        width: 100%;
      }

      .c1357 {
        min-height: 150px;
        padding: 5px;
        margin: auto;
        height: 0px;
      }

      .darkerfont {
        color: rgb(65, 69, 72);
      }

      .button {
        font-size: 12px;
        padding: 10px 20px;
        background-color: rgb(217, 131, 166);
        color: rgb(255, 255, 255);
        text-align: center;
        border-radius: 3px;
        font-weight: 300;
      }

      .table100.c1437 {
        text-align: left;
      }

      .cell.cell-bottom {
        text-align: center;
        height: 51px;
      }

      .card-title {
        font-size: 25px;
        font-weight: 300;
        color: rgb(68, 68, 68);
      }

      .card-content {
        font-size: 13px;
        line-height: 20px;
        color: rgb(111, 119, 125);
        padding: 10px 20px 0 20px;
        vertical-align: top;
      }

      .container {
        font-family: Helvetica, serif;
        min-height: 150px;
        padding: 5px;
        margin: auto;
        height: 0px;
        width: 90%;
        max-width: 550px;
      }

      .cell.c856 {
        vertical-align: middle;
      }

      .container-cell {
        vertical-align: top;
        font-size: medium;
        padding-bottom: 50px;
      }

      .c1790 {
        min-height: 150px;
        padding: 5px;
        margin: auto;
        height: 0px;
      }

      .table100.c1790 {
        min-height: 30px;
        border-collapse: separate;
        margin: 0 0 10px 0;
      }

      .browser-link {
        font-size: 12px;
      }

      .top-cell {
        text-align: right;
        color: rgb(152, 156, 165);
      }

      .table100.c1357 {
        margin: 0;
        border-collapse: collapse;
      }

      .c1769 {
        width: 30%;
      }

      .c1776 {
        width: 70%;
      }

      .c1766 {
        margin: 0 auto 10px 0;
        padding: 5px;
        width: 100%;
        min-height: 30px;
      }

      .cell.c1769 {
        width: 11%;
      }

      .cell.c1776 {
        vertical-align: middle;
      }

      .c1542 {
        margin: 0 auto 10px auto;
        padding: 5px;
        width: 100%;
      }

      .card-footer {
        padding: 20px 0;
        text-align: center;
      }

      .c2280 {
        height: 150px;
        margin: 0 auto 10px auto;
        padding: 5px 5px 5px 5px;
        width: 100%;
      }

      .c2421 {
        padding: 10px;
      }

      .c2577 {
        padding: 10px;
      }

      .footer {
        margin-top: 50px;
        color: rgb(152, 156, 165);
        text-align: center;
        font-size: 11px;
        padding: 5px;
      }

      .quote {
        font-style: italic;
      }

      .list-item {
        height: auto;
        width: 100%;
        margin: 0 auto 10px auto;
        padding: 5px;
      }

      .list-item-cell {
        background-color: rgb(255, 255, 255);
        border-radius: 3px;
        overflow: hidden;
        padding: 0;
      }

      .list-cell-left {
        width: 30%;
        padding: 0;
      }

      .list-cell-right {
        width: 70%;
        color: rgb(111, 119, 125);
        font-size: 13px;
        line-height: 20px;
        padding: 10px 20px 0px 20px;
      }

      .list-item-content {
        border-collapse: collapse;
        margin: 0 auto;
        padding: 5px;
        height: 150px;
        width: 100%;
      }

      .list-item-image {
        color: rgb(217, 131, 166);
        font-size: 45px;
        width: 100%;
      }

      .grid-item-image {
        line-height: 150px;
        font-size: 50px;
        color: rgb(120, 197, 214);
        margin-bottom: 15px;
        width: 100%;
      }

      .grid-item-row {
        margin: 0 auto 10px;
        padding: 5px 0;
        width: 100%;
      }

      .grid-item-card {
        width: 100%;
        padding: 5px 0;
        margin-bottom: 10px;
      }

      .grid-item-card-cell {
        background-color: rgb(255, 255, 255);
        overflow: hidden;
        border-radius: 3px;
        text-align: center;
        padding: 0;
      }

      .grid-item-card-content {
        font-size: 13px;
        color: rgb(111, 119, 125);
        padding: 0 10px 20px 10px;
        width: 100%;
        line-height: 20px;
      }

      .grid-item-cell2-l {
        vertical-align: top;
        padding-right: 10px;
        width: 50%;
      }

      .grid-item-cell2-r {
        vertical-align: top;
        padding-left: 10px;
        width: 50%;
      }
    </style>
  </div>



  @push('js')
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://unpkg.com/grapesjs@0.10.7/dist/grapes.min.js"></script>
  <script src="{{ asset('newsletter/dist/grapesjs-preset-newsletter.min.js') }}"></script>
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

      content_mail = $("#id-field-content").val();

    var editor = grapesjs.init({
      height: '100%',
      //noticeOnUnload: 0,
      storageManager: {
        autoload: 0,
      },
      assetManager: {
        assets: images,
        upload: 0,
        uploadText: 'Uploading is not available in this demo',
      },
      container: '#gjs',
      fromElement: true,
      plugins: ['gjs-preset-newsletter'],
      pluginsOpts: {
        'gjs-preset-newsletter': {
          modalLabelImport: 'Paste all your code here below and click import',
          modalLabelExport: 'Copy the code and use it wherever you want',
          codeViewerTheme: 'material',
          //defaultTemplate: templateImport,
          importPlaceholder: content_mail,
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

    // Simple warn notifier


    $(document).ready(function() {
      $('*[title]').each(function() {
        var el = $(this);
        var title = el.attr('title').trim();
        if (!title)
          return;
        el.attr('data-tooltip', el.attr('title'));
        el.attr('title', '');
      });

    });
  </script>
  @endpush

</body>