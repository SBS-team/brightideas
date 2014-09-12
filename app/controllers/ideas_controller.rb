class IdeasController < ApplicationController
  before_filter :authenticate_user!

  def show
   @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
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
    if params[:sort_criterion].present? #FIXME here and params[:search].present?
      case params[:sort_criterion]
        when 'sort_by_date'
          @idea = Idea.order(:created_at).page(params[:page]).per(8)
        when 'sort_by_comments'
          @idea = Idea.order(:comments_count => :desc).page(params[:page]).per(8)
        when 'sort_by_rating'
          @idea = Idea.order(:rate => :desc).page(params[:page]).per(8)
      end
    end

    if params[:search].present?
      @idea = Idea.where("lower(title) LIKE lower('%:search%')", search: params[:search]).page(params[:page]).per(8)
    end

    if params[:sort_criterion].blank? && params[:search].blank?
      @idea = Idea.all.page(params[:page]).per(8)
    end

  end

  def destroy
    idea = Idea.find(params[:id])
    idea.delete
  end

  def set_rating
    @rating =  Rating.find_or_initialize_by(:idea_id => params[:id], :user_id => current_user.id)
    @rating.rate = params[:rate]
    unless @rating.save
      flash[:error] = @rating.errors.messages
    end
    redirect_to :back
  end

  private
  def idea_params
    params.require(:idea).permit( :title, :description, :avatar_id)
  end

 end

