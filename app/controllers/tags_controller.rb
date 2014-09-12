class TagsController < ApplicationController
  before_filter :authenticate_user!

  def create
    tag = Tag.new(user_id: current_user.id, name: params[:tag_text])
    if tag.save
      render :json => {:tag_id => tag.id}
    else
      flash[:error] = tag.errors.messages
      redirect_to :back
    end
  end

  def destroy
    Tag.where(user_id: current_user.id, name: params[:tag_name]).first.destroy
  end

end
