class RegistrationsController < Devise::RegistrationsController
    
  # invisible_captcha only: [:create, :update], honeypot: :middle_name
  
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
   

  