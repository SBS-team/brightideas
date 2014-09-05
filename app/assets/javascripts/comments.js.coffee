$ ->
  $('.upvote').upvote()

  $('.reply').click ->
    reply_comment = ($(this).parents 'li').clone()
    $('#parent_comment_id').val reply_comment.attr "data-commentId"
    $("#reply_comment").html ''
    $('#reply_comment').append('<h4>Reply</h4>')
    reply_comment.find('a.reply').remove()
    reply_comment.find('div.upvote').remove()
    reply_comment.find('hr').remove()
    reply_comment.prepend "<span class='close'>x</span>"
    reply_comment.find('span.close').click ->
      $("#reply_comment").html ''
    reply_comment.addClass 'well'
    reply_comment.appendTo '#reply_comment'

  CKEDITOR.replace 'comment_text', {
    uiColor: "#e7e7e7",
    language: "en",
    height: '100px',
    resize_enabled: false,
    maxChar: 500,
    toolbar: [
      [ 'Bold', 'Italic', 'Underline', 'Strike' ],
      [ 'TextColor', 'BGColor' ],
      [ 'Link', 'Unlink'],
      [ 'Image', 'Flash', 'HorizontalRule', 'Smiley', 'SpecialChar']
    ]
  }

  CKEDITOR.instances.comment_text.on 'instanceReady', ->
    $('#cke_1_bottom').append "<span class='pull-right' id='counter_char'>Characters <span id='char_count'>0</span>/" +
                              this.config.maxChar + "</span>"

  CKEDITOR.instances.comment_text.on 'change', ->
    char_count = this.getData().length
    if char_count > this.config.maxChar
      $('.post-button').attr "disabled" , "disabled"
      $('.cke_toolbox a').addClass "cke_button_disabled"
      $('#counter_char').addClass "limit"
    else
      $('.post-button').removeAttr "disabled"
      $('.cke_toolbox a').removeClass "cke_button_disabled"
      $('#counter_char').removeClass "limit"
    $('#char_count').text char_count


  $('span.upvote').click ->
    comment_id = ($(this).parents 'li').attr "data-commentId"
    $.post '/comment/'+ comment_id + '/like'

  $('span.downvote').click ->
    comment_id = ($(this).parents 'li').attr "data-commentId"
    $.post '/comment/'+ comment_id + '/dislike'