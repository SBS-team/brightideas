class UsersController < ApplicationController
  include UsersHelper #FIXME remove helper and add autheticate
  def show
    @user = User.find(params[:id])
    @user_post = @user.rank.name
    @user_ideas = @user.ideas.page(params[:page]).per(3)
    gon.user_tags = @user.tags.pluck(:name)
    @user_last_activity = Time.at(last_user_activity(@user)).getlocal.to_s(:db) #FIXME move to model @user.last_user_activity(:db)
    # def last_user_activity(format = nil)
    #     if format == :db
    #     date.getlocal.to_s(:db)
    #     end
    # end
    gon.user_id = @user.id
    gon.current_user_id = current_user.id
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user, :user_post => @user_post, :last_activity => @user_last_activity,
                                    :user_tags => gon.user_tags, :user_ideas => @user_ideas.count } }
    end
  end

  def update
    @user = current_user
    if params[:user][:avatar].present? #FIXME move validate to model
      @user.update_attributes(:avatar => params[:user][:avatar])
    end
    redirect_to :back
  end

end
