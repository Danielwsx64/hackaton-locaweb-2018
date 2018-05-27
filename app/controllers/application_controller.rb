class ApplicationController < ActionController::Base
  before_action :set_notifications

  private

  def set_notifications
    @notifications = Notification.where(read: false)
  end
end
