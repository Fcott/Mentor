class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recent
    @unread_count = @notifications.unread.count
    @no_notifications_message = 'No notifications yet' 
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.now)
    render json: {success: true}
  end
end
