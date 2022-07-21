class TransactionsController < ApplicationController

  def new
  end

  #Webhook Url for Paystack after payment to create transaction 

  def success
    if params[:reference].present?
      redirect_to root_path, notice: "Sucessful Payment"
    else
      redirect_to new_sub_path, notice: "Error Making Payment, Try Again"
    end
  end
  
  #End

  def create
  	paystackObj = Paystack.new('pk_test_dbc69abc1c9ab93762b8fa610c3628dda0231e3c')
  	transactions = PaystackTransactions.new(paystackObj)
		result = transactions.initializeTransaction(
			:amount => params[:amount],
			:reference => "#{current_user.id}__#{rand.to_s[2..10]}",
			:email => current_user.email,
		)
  
    auth_url = result['data']['authorization_url']
	  redirect_to auth_url
  end

  def index
  end

  def edit
  end

end