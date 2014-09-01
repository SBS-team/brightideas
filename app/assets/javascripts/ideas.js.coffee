$ ->
  $('.col-link').each ->
    href = ($(this).find 'a.idea-title').attr 'href'
    $(this).click ->
      window.location.pathname = href
  $('.idea-description').each ->
    $(this).dotdotdot({
      watch: 'window'
    })