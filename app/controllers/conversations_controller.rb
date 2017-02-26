class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]


  def index
    @conversations = current_user.conversations.have_messages.desc_order
  end

  def show
    @conversation = Conversation.find(params[:id])
    @the_other = @conversation.the_other_user_of(current_user)
    @messages = @conversation.messages.recent_100
  end

  def create
    recipient = User.find_by(id: params[:recipient_id])
    users = [current_user, recipient]
    @conversation = Conversation.conversations_for(users)
    redirect_to @conversation
  end

  private

  def correct_user
    @conversation = Conversation.find(params[:id])
    redirect_to current_user unless current_user.user_of?(@conversation)
  end
end
