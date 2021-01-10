class SubscribersController < ApplicationController

  # invisible_captcha only: [:subscribe]

  def index
    @subscriber = Subscriber.new
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_lead] = true
      redirect_to root_path, notice: "Thank you for subscribing!"
    else
      redirect_to root_path, notice: "Oops! Something went wrong."
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
 