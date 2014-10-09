#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery-ui/position
#= require twitter/bootstrap
#= require jquery.dotdotdot.min
#= require jquery.timeago
#= require jquery.qtip.js
#= require ckeditor-jquery
#= require jquery-fileupload
#= require bootstrap-tags
#= require jquery.upvote
#= require jquery.dotdotdot
#= require jquery.infinitescroll
#= require avatar_preview
#= require jquery.dotdotdot.min
#= require wysihtml5-0.3.0

flashCallback = undefined
flashCallback = ->
  $(".alert").fadeOut()

$(".alert").bind "click", ((_this) ->
  (ev) ->
)(this)
$(".alert").fadeOut()
setTimeout flashCallback, 3000

wrapText = ->
  comment_field_width =  $('.list-group-item:first').width()
  $('.commentText p').css('width', comment_field_width - 150)
  $('.commentText p').addClass('wrap-text')

$(window).resize ->
  wrapText()

$(window).load ->
  wrapText()