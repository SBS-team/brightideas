class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_post = Rank.where(:id => @user.rank_id).first.name
  end
end
