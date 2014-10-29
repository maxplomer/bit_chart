class NotificationsController < ApplicationController

#user_id: nil, company_id: nil, percent_swing: nil

  def create
    user_id = params[:user_id].to_i
    company_id = params[:notification][:company_id].to_i
    percent_swing = params[:notification][:percent_swing].to_f

    if current_user.id == params[:user_id].to_i

      # want to delete any notifications already set for company 
      duplicate = Notification.where(user_id: user_id, company_id: company_id)
      duplicate[0].destroy unless duplicate[0].nil?

	  @notification = Notification.new(
	    user_id: user_id, 
	    company_id: company_id, 
	    percent_swing: percent_swing
	  )

	  if @notification.save && percent_swing != 0
	    redirect_to user_url(current_user)
	  else
	    flash[:errors] = ["Notification save error"]
	    redirect_to user_url(current_user)
	  end
	else
      flash[:errors] = ["Wrong user"]
      redirect_to user_url(current_user)
    end
  end


	#if percent swing is 0 destroy,
	# done implicitly because always removes previous, since percent_swing is 
	# 0 it just doesn't save  
end
