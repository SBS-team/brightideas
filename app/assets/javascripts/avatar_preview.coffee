$ ->
  $("[data-hide]").on "click", ->
    $("." + $(this).attr("data-hide")).hide()

  previewAvatar = (input) ->
    image_file_type_pattern = 'image.*'
    file  = input.files[0]
    if input.files and input.files[0]
      if file.type.match image_file_type_pattern
        reader = new FileReader()
        reader.onload = (e) ->
          $('.user-avatar').attr 'src', e.target.result
        reader.readAsDataURL input.files[0]
      else
        $('.alert').show()

  $('.avatar-field').change ->
    previewAvatar this