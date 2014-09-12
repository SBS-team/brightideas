$ ->

  show_popup = ->
    $(".user-link").each ->
      $(this).qtip('destroy', true)
      $(this).qtip({
        overwrite: true
        content: {
          text: (event, api)->
            $.ajax({
              url: $(this).attr("href")
              type: "GET"
              dataType: "json"
            }).then(
              (data)->
                title = data.user.first_name + " " + data.user.last_name
                content = '<div class="row"><div class="col-md-6">'
                content+= '<img src=' + data.user.avatar.popup_avatar.url + '></div><div class="col-md-6">'
                content+= '<div><span><i class="glyphicon glyphicon-user"></i>'+data.user_post+'</span></div>'
                content+= '<div><span>'+data.user_ideas+'  ideas</span></div>'
                content+= '<div class="last-activity"><span><i class="glyphicon glyphicon-time">
                                 </i> Last activity '+$.timeago(data.last_activity)+'</span></div></div></div>'
                content+= '<div class="row"><strong>'+data.user_tags.join(', ')+'</strong></div>'
                api.set('content.title.text', title)
                api.set('content.text', content)
              (xhr, status, error)->
                api.set('content.text', status + ': ' + error)
            )
            'Loading ...'
        },
        style: {
          classes: "qtip-bootstrap"
        },
        position: {
          my: 'bottom left'
          at: 'top right'
        }
      })

  $('.idea-description').dotdotdot({
    watch: 'window'
  })

  $(".idea-description div").attr style: ""
  $("[class^='idea-desc'] pre").attr style: "display:none"

  $('.idea-desc-block').dotdotdot({
      watch: 'window'
    })

  $("#md-tags").tags
    tagData: gon.user_tags
    maxNumTags: 10
    tagSize: 'lg'
    bootstrapVersion: '3'

  if gon.user_id isnt gon.current_user_id
    $('.tag-list > input').prop('disabled', true);
    $('.tags a').remove()


  $('.change-avatar').click ->
    $("#change-avatar-modal").modal('show')

  $('.submit-avatar').click ->
    $('.change-avatar-form').submit()

  show_popup()

  $(".ideas-container").infinitescroll
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: ".ideas-container"
    ->
      $('.idea-desc-block').dotdotdot()
      $('.idea-description').dotdotdot()
      $(".idea-description div").attr style: ""
      $("[class^='idea-desc'] pre").attr style: "display:none"
      show_popup()