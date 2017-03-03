class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notification, if: :user_signed_in?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def set_notification
    @notifications = Notification.where(recipient: current_user).recent
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
end
