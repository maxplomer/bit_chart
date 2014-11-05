class Api::TradesController < ApplicationController
  #before_action :require_signed_in!, :only => [:create]


  def show
    @trade = Trade.find(params[:id])
    render json: @trade
  end

  def index
    @trades = Trade.all
    render json: @trades
  end

  def create
    symbol = params["symbol"].upcase

    company = Company.find_by_symbol(symbol)

    price = MarketBeat.last_trade_real_time(company.symbol)


    if company.nil?
      flash[:errors] = ["We don't trade that ticker"]
    elsif !Quote.during_day?
      flash[:errors] = ["We don't trade after hours"]
    elsif price.nil?
      flash[:errors] = ["The price is nil"]
    else
      num_shares = params["num_shares"]

      @trade = Trade.new(
        user_id: params["user_id"].to_i,
        company_id: company.id,
        num_shares: num_shares,
        price: price
      )
 
      @trade.save
    end
  end
  
end
