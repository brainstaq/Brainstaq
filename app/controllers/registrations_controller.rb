class RegistrationsController < Devise::RegistrationsController
  
  def create
    build_resource(sign_up_params)

    NewGoogleRecaptcha.human?(
      params[:new_google_recaptcha_token],
      "user",
      NewGoogleRecaptcha.minimum_score,
      resource) && resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  
  private
  
      def sign_up_params
        params.require(:user).permit(:email, :password, :last_name, :first_name, :username, :country, :password_confirmation)
      end

      def account_update_params
        params.require(:user).permit(:id, :first_name, :last_name, :image, :image_url, :username, :country, :website, :phone, :gender, :bio, :email, :password, :password_confirmation, :current_password, :facebook_url, :twitter_url, :instagram_url, :linkedin_url)
      end
      
      def after_update_path_for(resource)
        profile_path(current_user.username)
      end

      # def destroy
      #   current_user.delete(params[:user])
      #   redirect_to root_path
      # end

      # def destroy
      #   resource.delete
      #   Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      #   set_flash_message :notice, :destroyed
      #   yield resource if block_given?
      #   respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
      # end
  end
   

  