class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    @notification = Notification.find params[:id]
    @notification.update_attributes read: true
  end

  def index
    render partial: "list", layout: false
  end
end
