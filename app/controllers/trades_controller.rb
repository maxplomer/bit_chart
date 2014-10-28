class TradesController < ApplicationController
  before_action :require_signed_in!, :only => [:create]

  def create
  	@trade = Trade.new(trade_params)
  	if current_user.id == params[:user_id].to_i && @trade.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = @trade.errors.full_messages
      redirect_to new_session_url
  	end
  end

  private

  def trade_params
    params.require(:trade).permit(:user_id, :company_id, :num_shares)
  end

end
