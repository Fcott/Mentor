class Stories::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story

  def create
    @story.likes.where(user_id: current_user.id).first_or_create

    recipient = @story.user
    Notification.create(recipient: recipient, actor: current_user, action: 'likes', notifiable: @story)

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    @story.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private
  def set_story
    @story = Story.find(params[:story_id])
  end
end
