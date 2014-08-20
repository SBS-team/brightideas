 class IdeasController < ApplicationController

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
      respond_to do |format|
      if @idea.save
        params[:attachments]['path'].each do |path|
          @attachment = @idea.attachments.create!(:path => path, :idea_id => @idea.id)
        end
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
      else
        format.html { render action: 'new' }
      end
      end
    end

    def index
      @attachments = Attachment.all
    end

    private
    def idea_params
      params.require(:idea).permit( :title, :description,  :attachments_attributes=>[:id, :idea_id, :path])
    end
 end

