$(document).ready ->
  $('.tag.label.label-info').click ->
    $('.tag.label.label-info').popover('hide')

  $('.tag.label.label-info').popover placement: "bottom"
  $('.upvote').upvote()
  return


