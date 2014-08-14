$(document).ready(function(){
 console.log($('#idea_attachments_path').val());
//    var formData = new FormData();
//    formData.append("attachment[:path]", $('#attachment_path').val());
 if($('#idea_attachments_path').val()===''){
  $('.clearfix').append('<input id="idea_attachments_path" type="file" name="attachments[path][]" multiple="multiple">')
 }
})
