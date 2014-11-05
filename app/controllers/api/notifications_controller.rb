class Api::NotificationsController < ApplicationController

  def show
    @notification = Notification.find(params[:id])
    render json: @notification
  end

  def index
    @notifications = Notification.all
    render json: @notifications
  end

  def create

    user_id = params["user_id"].to_i
    company_id = params["company_id"]
    percent_swing = params["percent_swing"]


    # want to delete any notifications already set for company 
    duplicate = Notification.where(user_id: user_id, company_id: company_id)
    duplicate[0].destroy unless duplicate[0].nil?

    @notification = Notification.new(
      user_id: user_id,
      company_id: company_id,
      percent_swing: percent_swing
    )

    if percent_swing != 0.0 && @notification.save 
      render json: @notification
    else
      render :json => @notification.errors, :status => :unprocessable_entity
    end
  end
  
end
