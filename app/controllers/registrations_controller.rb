class RegistrationsController < Devise::RegistrationsController

  # prepend_before_action :check_captcha, only: [:create]
  
  private
  
  def sign_up_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :username, :country, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:id, :first_name, :last_name, :image, :image_url, :username, :country, :website, 
      :phone, :gender, :bio, :email, :password, :password_confirmation, :current_password, 
      :facebook_url, :twitter_url, :instagram_url, :linkedin_url)
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
      
  def after_update_path_for(resource)
    profile_path(current_user.username)
  end

  # def check_captcha
  #   unless verify_recaptcha
  #     self.resource = resource_class.new sign_up_params
  #     resource.validate
  #     set_minimum_password_length
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end
end
   

  