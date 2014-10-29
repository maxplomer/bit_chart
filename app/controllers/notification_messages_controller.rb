class NotificationMessagesController < ApplicationController

  def index
  	user = User.find(params[:user_id])
  	if user.id == current_user.id
      @notification_messages = user.notification_messages
      render :index
    else
      flash[:errors] = ["Wrong user"]
      redirect_to root_url
    end
  end

end
