class PlanSubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  #before_action :verify_sub, only: [:new]

  #Webhook Url for Paystack after payment to create subscription /start 

  def success
    if params[:reference].present?
      paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
      plan_subscriptions = PaystackSubscriptions.new(paystackObj)
      result = subscriptions.create(
        :customer => current_user.email,
        :plan => "PLN_xc9vnk0qixif2m1", #plan id
        :amount => 50000 #in KOBO       
      )


      u = current_user
      u.subscribed_to_plan = true
      u.plan_subscription_code = code
      u.email_token = token
      u.save!
    
    else
      redirect_to new_plan_subscription_path, notice: "Error Making Payment, Try Again"
    end
  end

  #End

  def new
    
  end
  
  def create
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])

    transactions = PaystackTransactions.new(paystackObj)
    result = transactions.initializeTransaction(
    :reference => "#{current_user.id}__#{rand.to_s[2..10]}",
    :amount => 50000,
    :email => current_user.email,
    )
    
    auth_url = result['data']['authorization_url']
    redirect_to auth_url
  end

  def disable
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
    plan_subscriptions = PaystackSubscriptions.new(paystackObj)
    result = plan_subscriptions.disable(
        :code => "12328833",
        :token => "EWFWKFJWE" #user email token
      )
  end

  def enable
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
    plan_subscriptions = PaystackSubscriptions.new(paystackObj)
    result = plan_subscriptions.enable(
        :code => "12328833",
        :token => "EWFWKFJWE" #user email token
      )
  end

  private 

  def verify_sub
    if current_user.subscribed_to_plan == true 
      redirect_to dashboard_path(current_user.full_name)
    end
  end
end
