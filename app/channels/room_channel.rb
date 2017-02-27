class RoomChannel < ApplicationCable::Channel
  def subscribed
    message_user.conversations.each do |conversation|
     stream_from "Conversation:#{conversation.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @conversation = Conversation.find(data['conversation_id'])
    message = @conversation.messages.create(content: data['content'], user: message_user)
    MessageRelayJob.perform_later(message)
  end
end
