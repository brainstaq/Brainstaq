class ProcessWebhookJob < ApplicationJob
  queue_as :process_web_hook

  require 'subscription'

  include Subscription
  
  def perform(options)
    if options['event'] == 'charge.success'
      Subscription::SubscriptionActivity.new(options).call
    end
  end
end