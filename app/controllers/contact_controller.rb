class ContactController < ApplicationController
  
  before_action :contact_params, only: [:create]
  
  def index
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to new_contact_path, notice: "Your message has been sent. Thank you!"
    else
      redirect_to new_contact_path, notice: "Oops! Something went wrong."
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname, :subject)
  end
end
