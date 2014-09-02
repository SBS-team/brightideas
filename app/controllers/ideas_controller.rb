class IdeasController < ApplicationController
  before_filter :authenticate_user!

  def show
   @idea = Idea.find(params[:id])
   @attachments = @idea.attachments.all
  end

  def new
    @idea = Idea.new
    @attachments = @idea.attachments.build
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id

    respond_to do |format|
      if @idea.save
        if !params[:attachments].blank?
          @attachments = params[:attachments].split(' ')
          @attachments.each do |attach_id|
            @attach = Attachment.find(attach_id)
            @attach.idea_id = @idea.id
            @attach.save
          end
        end

        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json {render :json => @idea  }
      else
        format.html { render action: 'new', notice: "Title and description can't be blank!" }
      end
    end
  end

  def index
      @idea = Idea.all
   end


  private
  def idea_params
    params.require(:idea).permit( :title, :description, :avatar_id)
  end


 end

