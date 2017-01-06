class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    if current_user == @conversation.sender || @conversation.recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.for_display
    else
      redirect_to conversations_path, alart: "You don't have permission to accsess"
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.for_display

    if @message.save
      ActionCable.server.broadcast 'room_channel',
                                      message: render_message(@message)
    end
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
