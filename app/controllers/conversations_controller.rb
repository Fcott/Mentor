class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]


  def index
    @conversations = Conversation.involving(current_user)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
    @messages = @conversation.messages.for_display
  end

  def create
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first_or_create
    redirect_to @conversation
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def correct_user
    @conversation = Conversation.find(params[:id])
    redirect_to current_user unless current_user == @conversation.sender || @conversation.recipient
  end
end
