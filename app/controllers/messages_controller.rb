class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def create
    message = @conversation.messages.new(message_params)
    message.user = current_user
    message.save
    MessageRelayJob.perform_later(message)
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
