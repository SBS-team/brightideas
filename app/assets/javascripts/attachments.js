$(document).ready(function(){
    $("#post_idea").click(function(){
        if($("#fileupload .template-upload .bar").length == 0){
            IdeaCreate();
        }
    });

    $('#fileupload').fileupload({
        maxFileSize: 31457280,
        maxNumberOfFiles: 10
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
                description: $('.cke_wysiwyg_frame').contents().find('body').html()
            },
            attachments: $("#attachments").val()
        }, function(data){
            window.location.pathname = '/ideas/' + data.id;
        }, "json");
    }
});
