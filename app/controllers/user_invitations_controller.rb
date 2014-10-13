class UserInvitationsController < Devise::InvitationsController

  def edit
    render :edit, :layout => true
  end

  def update
    self.resource = resource_class.accept_invitation!(permitted_params)
    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)
      redirect_to  edit_user_registration_path(resource), :alert => "Welcome! Please fill out your profile."
    else
      respond_with_navigational(resource){ render :edit, :layout => false }
    end
  end

  private
  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :rank_id, :office_id, :email, :invitation_token, :password, :password_confirmation)
  end

end
