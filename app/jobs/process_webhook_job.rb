class ProcessWebhookJob < ApplicationJob
  queue_as :process_web_hook

  def perform(options)
    if options['event'] == 'charge.success'
      # Membership::SubscriptionActivity.new(options).call
    end
  end
end