class Api::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @trades_company_id = []
    @trades_num_shares = []
    @trades_price = []
    @user.trades.each do |trade|
	  @trades_company_id.push(trade.company_id)
	  @trades_num_shares.push(trade.num_shares)
	  @trades_price.push(trade.price)
    end

    render "show"
  end

  def index
    @users = User.all
    render "index"
    #render json: @users
  end
  
end
