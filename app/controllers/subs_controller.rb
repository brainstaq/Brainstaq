class SubsController < ApplicationController
  before_action :authenticate_user!
  # before_action :verify_sub, only: [:new]

 

  #Webhook Url for Paystack after payment to create subscription /start 

  def success
    if params[:reference].present?

      paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])

      subs = PaystackSubs.new(paystackObj)
      result = subs.create(

        :customer => current_user.email,
        :plan => "PLN_96ws6ovviw8028d", #plan id
        :amount => 200000 #in KOBO   
      )


      u = current_user
      u.subscribed = true
      u.subscription_code = code
      u.email_token = token
      u.save!
    
    else
      redirect_to new_sub_path, notice: "Error Making Payment, Try Again"

    end
  end

  #End

  def new
    @paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
		page_number = 1
		plans = PaystackPlans.new(@paystackObj)
		result = plans.list(page_number)  #Optional `page_number` parameter,  50 items per page
		@plans_list = result['data']
		@sub = Sub.new
  end
  
  def create
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])

    transactions = PaystackTransactions.new(paystackObj)
    result = transactions.initializeTransaction(
    :reference => "#{current_user.client_id}__#{rand.to_s[2..10]}",
    :amount => 200000,
    :email => current_user.email,
    )
    auth_url = result['data']['authorization_url']

    redirect_to auth_url
  end

  def disable
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
    subs = PaystackSubs.new(paystackObj)
    result = subs.disable(
        :code => "12328833",
        :token => "EWFWKFJWE" #user email token
      )
  end

  def enable
    paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
    subs = PaystackSubs.new(paystackObj)
    result = subs.enable(
        :code => "12328833",
        :token => "EWFWKFJWE" #user email token
      )
  end

  private 

  # def verify_sub
  #   if current_user.subscribed == true 
  #     redirect_to root_path
  #   end
  # end

  
end
