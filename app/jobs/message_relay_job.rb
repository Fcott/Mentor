class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.conversation.update(last_message: Time.now)
    ActionCable.server.broadcast "Conversation:#{message.conversation.id}", {
      message: MessagesController.render(message),
      conversation_id: message.conversation.id,
      timestamp: message.sent_time,
      content: message.content
    }
  end
end
