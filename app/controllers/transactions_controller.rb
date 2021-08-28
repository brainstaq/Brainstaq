class TransactionsController < ApplicationController
  def new
	end
	
	#Webhook Url for Paystack after payment to create transaction 
	
	def success
		if params[:reference].present?
			redirect_to root_path, notice: "Sucessful Payment"
		else
			redirect_to new_plan_subscription_path, notice: "Error Making Payment, Try Again"
		end
	end
	
	#End
	
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
	
	def index
	end
	
	def edit
	end
end