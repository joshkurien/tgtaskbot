class SendMessageJob
  include Sidekiq::Worker
  sidekiq_options queue: 'default', retry: 3

  # sidekiq_retries_exhausted do |message|
  #   Raven.capture_message("Failed #{message['class']}: #{message['error_message']}",
  #                         extra: { job_args: message['args'] })
  # end

  def perform(chat_id,message)
    TelegramClient.send_message(chat_id,message)
  end

end