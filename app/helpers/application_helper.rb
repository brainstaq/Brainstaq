module ApplicationHelper
  include Pagy::Frontend

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
  
  def resource_name
    :user
  end
    
  def resource_class 
    User 
  end
    
  def resource
    @resource ||= User.new
  end
    
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def author_of(resource)
    user_signed_in? && resource.user_id == current_user.id
  end

  def admin?
    user_signed_in? && current_user.admin?
  end
end
