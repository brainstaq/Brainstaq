class ContactController < ApplicationController
  
  before_action :contact_params, only: [:create]
  
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      @contact = Contact.new
      redirect_to root_path, notice: 'Thank you for your message!'
    else
      redirect_to root_path, notice: 'Message not sent!'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname, :subject)
  end
end
