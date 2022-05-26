class SessionsController < Devise::SessionsController
  respond_to :html, :js
  
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end
  # POST /resource/sign_in
  
  
end