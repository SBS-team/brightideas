$ ->
  CKEDITOR.replace "description",
    uiColor: "#e7e7e7"
    language: "en"
    toolbar: [
      [ 'Undo', 'Redo' ]
      ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord']
      [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ]
      ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
      [ 'Link', 'Unlink']
      [ 'TextColor', 'BGColor' ]
      [ 'Maximize', 'ShowBlocks' ]
      [ 'Styles', 'Format', 'Font', 'FontSize' ]
      ['Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak']
    ]

  $('#avatarupload').fileupload
    maxFileSize: 5000000
    acceptFileTypes: "/(\.|\/)(gif|jpe?g|png)$/i"
    maxNumberOfLines: 1
    autoUpload: true
    dropZone: $('#avatarupload')
    downloadTemplateId: 'template-download-avatar'
    uploadTemplateId: 'template-upload-avatar'
    dataType: 'json'
    paramName: 'attachment[path]'
    completed: (e, data) ->
      $('#avatar').val data.result.files[0].attachment_id

  $('#post_idea').click ->
    if isValid()
      if $('#fileupload .template-upload .bar').length == 0
        IdeaCreate()
    else
      ShowError()

  $("#fileupload").fileupload(
    maxFileSize: 31457280
    maxNumberOfFiles: 10
    dropZone: $("#fileupload")
    paramName: "attachment[path]"
  ).bind("fileuploadstopped", (e, data) ->
    IdeaCreate()
  ).bind "fileuploadcompleted", (e, data) ->
    $("#attachments").val $("#attachments").val() + data.result.files[0].attachment_id + " "

  IdeaCreate = ->
    $.post "/ideas",
      idea:
        title: $("#title").val()
        description: $(".cke_wysiwyg_frame").contents().find("body").html()
        avatar_id: $("#avatar").val()
      attachments: $("#attachments").val()
    ,(data) ->
        window.location.pathname = "/ideas/" + data.id
    , "json"

  isValid = ->
    $('#title').val isnt "" and $('.cke_wysiwyg_frame').contents().find('body').text() isnt ""

  ShowError = ->
    $('.alert').remove()
    $('.container').last().prepend "<div class='alert alert-danger'><a class='close' data-dismiss='alert'>×</a>" +
                                                                    "<span>Title and description can't be blank!</span></div>"