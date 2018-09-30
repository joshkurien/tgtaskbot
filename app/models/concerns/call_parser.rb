class CallParser
  def self.process(message)
    user = User.get_user(message[:from])

    case message[:text]
      when '/start'
        start(user.telegram_id)
      else
        default_response(message[:chat][:id])
    end
  end

  private
  def self.start(chat)
    # SendMessageJob.perform_async(chat,
    TelegramClient.send_message(chat,
                                 (Response.get_random_text(Response.keys[:welcome])))
  end

  def self.default_response(chat)
    # SendMessageJob.perform_async(chat, Response.get_random_text(Response.keys[:spam]))
    TelegramClient.send_message(chat, Response.get_random_text(Response.keys[:spam]))
  end
end