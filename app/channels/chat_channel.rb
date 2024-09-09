class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end

  def speak(data)
    message = data['message'] || ''
    ActionCable.server.broadcast("chat_channel", message)
  end
end
