$ ->
  $('.col-link').each ->
    href = ($(this).find 'a.idea-title').attr 'href'
    $(this).click ->
      window.location.pathname = href

  $('.idea-description').dotdotdot({
      watch: 'window'
    })

  $("div[id^='highlighter_']").attr style: ""

  $('.idea-desc-block').dotdotdot({
      watch: 'window'
    })

  $("#md-tags").tags
    tagData: gon.user_tags
    maxNumTags: 10
    tagSize: 'lg'
    bootstrapVersion: '3'

  $('.change-avatar').click ->
    $("#change-avatar-modal").modal('show')

  $('.submit-avatar').click ->
    $('.change-avatar-form').submit()


  $(".ideas-container").infinitescroll
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: ".ideas-container"
    ->
      $('.idea-desc-block').dotdotdot()
      $('.idea-description').dotdotdot()