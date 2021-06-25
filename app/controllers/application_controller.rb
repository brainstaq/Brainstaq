class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def moon
  #   cookies[:moon] = {
  #     value: 'dark mode on'
  #   }
  #   if @user_signed_in
  #     redirect_to dashboard_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  # def sun
  #   cookies.delete(:moon)
  #   if @user_signed_in
  #     redirect_to dashboard_path
  #   else
  #     redirect_to root_path
  #   end
  # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [:id, :first_name, :last_name, :image, :username, :country, :website, :phone, :gender, :bio, :email, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_in, 
      keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, 
      keys: [:id, :first_name, :last_name, :image, :username, :country, :website, :phone, :gender, :bio, :email, :password, :password_confirmation, :current_password])
  end
  

  def after_sign_in_path_for(resource)
    if @user == 'admin'
      rails_admin_path
    else
      dashboard_path(@user.full_name)
    end
  end
end
