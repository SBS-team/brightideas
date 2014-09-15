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
        flash[:error] = "Title and description can't be blank!"
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update(title: params[:idea][:title], description: params[:idea][:description])
      redirect_to @idea, notice: 'Idea was successfully changed'
    else
      flash[:error] = "Title and description can't be blank!"
      redirect_to :back
    end
  end

  def index

    @idea = Idea.all.page(params[:page]).per(8)

    if params[:search].present?
      @idea = @idea.where("lower(title) LIKE lower('%" + params[:search] + "%')")#.page(params[:page]).per(8)
    end

    if params[:sort_by_column].present?
      @idea = @idea.order(params[:sort_by_column] => :desc)#.page(params[:page]).per(8)
    end

    @idea

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

