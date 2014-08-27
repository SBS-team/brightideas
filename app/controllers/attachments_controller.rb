class AttachmentsController < ApplicationController
  def create
    puts '---' * 15
    @upload = Attachment.new(attachment_params)
    puts @upload.inspect

    respond_to do |format|
      if @upload.save
        format.html {
          render :json => [@upload.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def attachment_params
    params.require(:attachment).permit(:path, :tempfile, :original_filename, :content_type, :headers, :name, :filename)
  end
end
