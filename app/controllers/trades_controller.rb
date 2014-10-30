class TradesController < ApplicationController
  before_action :require_signed_in!, :only => [:create]

  def create
 
    symbol = params["trade"]["symbol"].upcase
    company = Company.find_by_symbol(symbol)
    price = StockQuote::Stock.quote(symbol).ask
    
    if company.nil?
      flash[:errors] = ["We don't trade that ticker"]
      redirect_to user_url(current_user)
    elsif !during_day?
      flash[:errors] = ["We don't trade after hours"]
      redirect_to user_url(current_user)
    elsif price.nil?
      flash[:errors] = ["The price is nil"]
      redirect_to user_url(current_user)
    else
      num_shares = params["trade"]["num_shares"]

      @trade = Trade.new(
        user_id: params["user_id"].to_i,
        company_id: company.id,
        num_shares: num_shares,
        price: price
      )

      if current_user.id == params[:user_id].to_i && @trade.save
        redirect_to user_url(current_user)
      else
        flash[:errors] = ["Trade error"]
        redirect_to user_url(current_user)
      end
    end
  end

  private

  # for trading and saving stock quotes
  def during_day?
    now = Time.new
    if now.saturday? || now.sunday?
      return false
    end 

    #convert time to integer
    now_integer = now.hour * 60 + now.min
    open = 9 * 60 + 30                    # 9:30 am
    close = 16 * 60                       # 4pm

    now_integer.between?(open, close)
  end

end
