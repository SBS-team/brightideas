class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?	

  protect_from_forgery with: :exception

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:is_admin?)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :office_id ,:email, :avatar, :rank_id, :password, :password_confirmation) }
  end

end
