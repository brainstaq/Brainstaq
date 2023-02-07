module Subscription

  class SubscriptionActivity

    def initialize(options)
      @user = user.find(options['user_id'])
      @paid_date = options['data']['paid_at']
      @subscribe_date = @paid_date
      @channel = options['data']['authorization']['channel']
      @amount = options['data']['amount'].to_i / 100
      @auth_code = options['data']['authorization']['authorization_code']
      @transaction_reference = options['data']['reference']
      @subscription_status = 0
      @expiry_date = set_expiry_date
    end

    def call
      update_account_detail
      create_charge
      update_user_paystack_auths
      process_charge_success
    end


    def process_charge_success
      @user.paystack_charges.create(
        paid_at: @paid_date,
        plan: @charge_plan,
        amount: @amount,
        channel: @channel,
      )
    end

    def create_charge
      duration = @user.subscription_plan.duration
      charge = @user.charges.new(service_plan: "Subscription Renewal",
        amount: @amount,
        payment_method: fund_method,
        duration: duration,
        brainstaq_transaction_id: SecureRandom.hex(4) )
      if charge.save
        UserMailer.renewal(@user).deliver_later
      end
    end

    def update_user_paystack_auths
      @user.paystack_auth_code = @auth_code
      @user.save
    end
    

    def update_account_detail
      account_update = @user.account_detail.update!(
        subscribe_date: @subscribe_date,
        expiry_date: @expiry_date,
        user_status: 0,
        amount: @amount,
        recurring_billing: true 
      )
    end
    

    def retrieve_amount
      amount = @user.subscription_plan.cost
    end


    def retrieve_subscription_plan
      @user.subscription_plan.plan_name
    end

    
    def set_subscribe_date
      date = DateTime.now.strftime('%d-%m-%Y %H:%M:%S')
    end


    def set_expiry_date
      plan_duration = @user.subscription_plan.duration
      if plan_duration == "monthly"
        expiry_date =  (DateTime.parse(@subscribe_date) + 30).strftime('%d-%m-%Y %H:%M:%S')
      elsif plan_duration == "quarterly"
        expiry_date =  (DateTime.parse(@subscribe_date) + 90).strftime('%d-%m-%Y %H:%M:%S')
      elsif plan_duration == "annually"
        expiry_date = (DateTime.parse(@subscribe_date).next_year).strftime('%d-%m-%Y %H:%M:%S')
      end
      expiry_date
    end


    def get_subscription_plan_code
      @user.subscription_plan.paystack_plan_code
    end 
  end
end

