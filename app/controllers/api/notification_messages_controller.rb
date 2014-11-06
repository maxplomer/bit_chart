class Api::NotificationMessagesController < ApplicationController

  def show
    @notification_message = NotificationMessage.find(params[:id])
    render json: @notification_message
  end

  def index
    @notification_messages = NotificationMessage.all
    render json: @notification_messages
  end

end