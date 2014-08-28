$(document).ready(function(){
    $("#description").ckeditor({});

    $('#avatarupload').fileupload({
        maxFileSize: 5000000,
        acceptFileTypes: "/(\.|\/)(gif|jpe?g|png)$/i",
        maxNumberOfFiles: 1,
        autoUpload: true,
        dropZone: $('#avatarupload'),
        downloadTemplateId: "template-download-avatar",
        uploadTemplateId: "template-upload-avatar",
        dataType: "json",
        completed: function(e,data){
            $('#avatar').val(data.result.files[0].attachment_id);
        }
    });
    $("#post_idea").click(function(){
        if($("#fileupload .template-upload .bar").length == 0){
            IdeaCreate();
        }
    });
//    $('#fileupload').on('submit',true);
    $('#fileupload').fileupload({
        maxFileSize: 31457280,
        maxNumberOfFiles: 10,
        dropZone: $('#fileupload')
    })
        .bind('fileuploadstopped', function (e, data) {
           IdeaCreate();
        })
        .bind('fileuploadcompleted', function (e, data) {
            $("#attachments").val($("#attachments").val() + data.result.files[0].attachment_id + " ");
        });

    function IdeaCreate(){
        $.post("/ideas", {
            idea:{
                title: $("#title").val(),
                description: $('.cke_wysiwyg_frame').contents().find('body').html(),
                avatar_id: $('#avatar').val()
            },
            attachments: $("#attachments").val()
        }, function(data){
            window.location.pathname = '/ideas/' + data.id;
        }, "json");
    }
});
