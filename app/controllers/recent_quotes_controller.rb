class RecentQuotesController < ApplicationController

  def create
    symbol = params["recent_quote"]["symbol"].upcase
    company = Company.find_by_symbol(symbol)

    if company.nil?
      flash[:errors] = ["We don't trade that ticker"]
      redirect_to root_url
    elsif params.include?(:user_id)

      # want to delete recent recent_quote duplicates
      # find same company previously and destroy 
      duplicate = RecentQuote.where(user_id: params[:user_id], company_id: company.id)
      duplicate[0].destroy unless duplicate[0].nil?

      RecentQuote.create(user_id: params[:user_id], company_id: company.id)
      # might be better to just update the timestamps
      redirect_to company_url(company)
    else
      redirect_to company_url(company)
    end
  end

end
