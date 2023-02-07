module PaymentProcessing

  class Subscribe

      def initialize(options)
          @user = options[:user]
          @reference = options[:reference] ||= nil
          @paystack_key = options[:paystack_key] ||= nil
          @current_user = options[:user]
          @subscribe_date = options[:subscribe_date] ||= nil
          @expiry_date = options[:expiry_date] ||= nil
          @subscription_status = options[:subscription_status] ||= nil
          @payment_method = options[:payment_method] ||= nil
          @amount = options[:amount] ||= nil
      end

      def verify_transaction
          begin
              uri = URI("https://api.paystack.co/transaction/verify/#{@reference}")
              http = Net::HTTP.new(uri.host, uri.port)
              http.use_ssl = true
              http.verify_mode = OpenSSL::SSL::VERIFY_NONE
              req = Net::HTTP::Get.new(uri.path, {
                  'Authorization' => "Bearer #{@paystack_key}"
              })
              res = http.request(req)
              subscribe = JSON.parse(res.body)
          rescue => e
              puts "failed #{e}"
              Raven.capture_exception(e)
          end
      end

      def paystack_subscribe
          result = verify_transaction
          if result["status"] == true
              auth_code = (result["data"]["authorization"]["authorization_code"]).to_s
              paystack_customer_code = (result["data"]["customer"]["customer_code"]).to_s

              ## Decided not to use paystack start date because of the flexibility
              # of using manual start date at the point of registration
              start_date = set_paystack_next_charge_date
              plan_code  = get_subscription_plan_code
              payload = {
                  :customer => paystack_customer_code,
                  :plan => plan_code,
                  :authorization => auth_code,
                  :start_date => start_date,
              }
              subscribe = ''
              begin
                  uri = URI('https://api.paystack.co/subscription')
                  http = Net::HTTP.new(uri.host, uri.port)
                  http.use_ssl = true
                  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
                  req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json',
                                                       'Authorization' => "Bearer #{@paystack_key}" })
                  req.body = JSON.generate(payload)
                  res = http.request(req)
                  subscribe = JSON.parse(res.body)
              rescue => e
                  puts "failed #{e}"
                  Raven.capture_exception(e)
              end

              if subscribe["status"] == true
                  subscription_code = subscribe["data"]["subscription_code"].to_s
                  email_token = subscribe["data"]["email_token"].to_s
                  @user.update(paystack_subscription_code: subscription_code,
                                 paystack_email_token: email_token,
                                 paystack_auth_code: auth_code,
                                 paystack_cust_code: paystack_customer_code)
                  paystack_created_date = subscribe["data"]["createdAt"]
                  @subscribe_date = set_subscribe_date
                  @expiry_date = set_expiry_date
                  @payment_method = retrieve_payment_method
                  @amount = retrieve_amount
                  @subscription_status = 0
                  create_charge
                  account_update = update_account_detail
                  
                  return 200
              else
                  return 500
              end
          else
              return 400
          end
      end

      def get_subscription_plan_code
        @user.subscription_plan.paystack_plan_code
      end

      def set_subscribe_date
          ## Hack to set start date for renewals
          ## @user.account_detail.created_at < DateTime.now - 1.day
          ## set date to today's date if there is no history of subscription history
          if @user.subscription_histories.empty?
            date = DateTime.now
          else
            date = @user.account_detail.subscribe_date
          end
          return date
      end

      def set_expiry_date
          if @user.subscription_plan.duration == "monthly"
              expiry_date =  (@subscribe_date + 30.days).strftime('%d-%m-%Y %H:%M:%S')
          elsif @user.subscription_plan.duration == "annually"
              expiry_date =  (@subscribe_date.next_year).strftime('%d-%m-%Y %H:%M:%S')
          end
          expiry_date
      end

      # method to set the next start date Paystack should charge a customer
      def set_paystack_next_charge_date
          if @user.account_detail.created_at.to_date < Date.today - 1.day
            date = DateTime.now
          else
            date = @user.account_detail.subscribe_date
          end
          if @user.subscription_plan.duration == "monthly"
              start_date = date.next_month.strftime('%FT%T%:z').to_s
          elsif @user.subscription_plan.duration == "annually"
              start_date = date.next_year.strftime('%FT%T%:z').to_s
          end
          return start_date
      end



      private

      def create_charge
          charge = @user.charges.new(service_plan: retrieve_plan,
            amount: retrieve_amount,
            duration: @user.subscription_plan.duration,
            brainstaq_transaction_id: SecureRandom.hex(4)
          )
          if charge.save
            UserMailer.new_subscription(@user).deliver_later
          end

      end

      def retrieve_plan
        plan = @user.subscription_plan.plan_name
      end

      def retrieve_payment_method
        @user.payment_method.payment_system
      end


      def update_account_detail
        account_update = @user.build_account_detail(
          subscribe_date: @subscribe_date,
          expiry_date: @expiry_date,
          user_status: 0,
          amount: @amount,
          plan: retrieve_plan,
          recurring_billing: true,
          audit_comment: "paid for subscription plan" 
        )
      end

      def create_subscription_history
        subscription_history = @user.subscription_histories.create(
          subscribe_date: @subscribe_date,
          expiry_date: @expiry_date,
          subscription_type: 0,
          subscription_plan: retrieve_plan,
          amount: retrieve_amount,
          payment_method: retrieve_payment_method,
          user_status: 0,
          subscription_status: @subscription_status
        )
      end

      def retrieve_amount
          amount = @user.subscription_plan.cost
      end

  end
end