ActiveAdmin.register User do

  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation do
    @user = User.new
  end

  collection_action :send_invitation, :method => :post do
    @user = User.invite!(permitted_params[:user])
    if @user.errors.empty?
      flash[:success] = "User has been successfully invited." 
      redirect_to admin_users_path
    else
      flash[:error] = "Invitation sending error occured"
      redirect_to new_invitation_admin_users_path
    end
  end

  controller do
    def permitted_params
      params.permit :user => [:email]
    end
 end

end