class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_post = Rank.where(:id => @user.rank_id).first.name
    @user_ideas = Idea.where(:user_id => @user.id)
  end

  def update
    @user = current_user
    if params[:user][:avatar].present?
      @user.update_attributes(:avatar => params[:user][:avatar])
    end
    redirect_to :back
  end

end
