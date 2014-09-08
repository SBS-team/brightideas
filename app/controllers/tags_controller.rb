class TagsController < ApplicationController
  def create
    if params[:tag_text].present?
      tag = Tag.create(user_id: current_user.id, name: params[:tag_text])
      render :json => {:tag_id => tag.id}
    end
  end

  def destroy
    if params[:tag_name].present?
      Tag.where(:name => params[:tag_name]).first.destroy
    end
  end

end
