$ ->
  previewAvatar = (input) ->
    if input.files and input.files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        $('.user-avatar').attr 'src', e.target.result
      reader.readAsDataURL input.files[0]

  $('.avatar-field').change ->
    previewAvatar this