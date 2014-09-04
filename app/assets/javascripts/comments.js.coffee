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