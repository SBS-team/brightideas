$(document).ready ->
  $('.idea-desc-block').dotdotdot({
      watch: 'window'
    });

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