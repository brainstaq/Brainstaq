# Controller to handle Event.
class PaystackController < ApplicationController
  #skip_before_action :authorize_request, only: :webhook
  skip_before_action :verify_authenticity_token

  def webhook
    paystack_instance = PaystackObject.instance
    valid_event = paystack_instance.verify_webhook_event?(request)

    raise StandardError, 'Phony event - Not Paystack' unless valid_event
    #render status: 200, plain: "Ok\n"
    render json: {:status => 200}
  end
end

# PaystackObject: This class validates each request, to check 
# If it's from Paystack or not. 
class PaystackObject
  include Singleton
  attr_accessor :paystack_obj

  WHITELISTED_IPS = ['52.31.139.75', '52.49.173.169', '52.214.14.220'].freeze

  def initialize
    secret_key = ENV['PAYSTACK_PRIVATE_KEY'].split(' ')[1]
    @paystack_obj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], secret_key)
  end

  def verify_webhook_event?(request)
    verify_ip_address(request.remote_ip) && verify_header_signature(request)
  end

  private

  def verify_ip_address(ip_address)
    WHITELISTED_IPS.include?(ip_address)
  end

  def verify_header_signature(request)
    body = request.body.string
    hash = OpenSSL::HMAC.hexdigest('SHA512', @paystack_obj.private_key, body)
    hash == request.headers['HTTP_X_PAYSTACK_SIGNATURE']
  end
end