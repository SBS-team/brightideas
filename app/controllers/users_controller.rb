class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_post = Rank.where(:id => @user.rank_id).first.name
    @user_ideas = Idea.where(:user_id => @user.id).page(params[:page]).per(3)
    gon.user_tags = Tag.where(:user_id => @user.id).pluck(:name)
    gon.user_id = @user.id
    gon.current_user_id = current_user.id
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user, :user_post => @user_post,
                                    :user_tags => gon.user_tags, :user_ideas => @user_ideas.count } }
    end
  end

  def update
    @user = current_user
    if params[:user][:avatar].present?
      @user.update_attributes(:avatar => params[:user][:avatar])
    end
    redirect_to :back
  end

end
