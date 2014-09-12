class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @upload = Attachment.new(attachment_params)

    respond_to do |format|
      if @upload.save
        format.html { render action: "new" }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
  def attachment_params
    params.require(:attachment).permit(:path)
  end

end
