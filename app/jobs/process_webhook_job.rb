class ProcessWebhookJob < ApplicationJob
  queue_as :process_web_hook

  def perform(options)
    if options['event'] == 'charge.success'
      
    end
  end
end