ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation do
    @user = User.new
  end

  collection_action :send_invitation, :method => :post do
    @user = User.invite!(params[:user]) 
    if @user.errors.empty?
      flash[:success] = "User has been successfully invited." 
      redirect_to admin_users_path
    else
      flash[:error] = "Invitation sending error occured"
      redirect_to new_invitation_admin_users_path
    end
  end

  # form do |f|
  #   f.inputs "User Details" do
  #     f.input :email
  #     f.input :rank
  #     f.input :password
  #   end
  #   f.actions
  # end

  controller do
    def permitted_params
      params.permit :user => [:email] #, :rank_id, :password]
    end
 end

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end