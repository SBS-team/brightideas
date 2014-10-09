class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_post = @user.rank.name
    @user_ideas = @user.ideas.page(params[:page]).per(3)
    @user_office = @user.office.number
    gon.user_tags = @user.tags.pluck(:name)
    gon.user_id = @user.id
    gon.current_user_id = current_user.id
    respond_to do |format|
      format.html
      format.json { render :json => {
          :user => @user, :user_post => @user_post,
          :last_activity => @user.last_activity(:db),
          :user_tags => gon.user_tags,
          :user_ideas => @user_ideas.count,
          :user_office => @user_office
        }
      }
    end
  end

  def update
    @user = current_user
    if params[:avatar].present?
      unless @user.update_attributes(:avatar => params[:avatar])
        flash[:error] = 'You are not allowed to upload this file, allowed types: jpg, jpeg, gif, png'
      end
    end
    redirect_to :back
  end

end