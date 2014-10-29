class RecentQuotesController < ApplicationController

  def create
    symbol = params["recent_quote"]["symbol"].upcase
    company = Company.find_by_symbol(symbol)

    if company.nil?
      flash[:errors] = ["We don't trade that ticker"]
      redirect_to root_url
    elsif params.include?(:user_id)
       RecentQuote.create(user_id: params[:user_id], company_id: company.id)
    end

    redirect_to company_url(company)
  end




end
