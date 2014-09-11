class TagsController < ApplicationController
  #FIXME authenticate?
  def create
    if params[:tag_text].present? #FIXME move validation to model
      tag = Tag.create(user_id: current_user.id, name: params[:tag_text])
      render :json => {:tag_id => tag.id}
    end
  end

  def destroy
    Tag.find_by!(name: params[:tag_name]).destroy #FIXME current_user?
  end

end
