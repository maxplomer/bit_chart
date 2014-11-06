class Api::RecentQuotesController < ApplicationController

  def show
    @recent_quote = RecentQuote.find(params[:id])
    render json: @recent_quote
  end

  def index
    @recent_quotes = RecentQuote.all
    render json: @recent_quotes
  end

  def create
    logger.info("HELLWORLDHELLOWRLD")
    user_id = params["user_id"]
    symbol = params["symbol"].upcase
    company = Company.find_by_symbol(symbol)
    logger.info(company.name)
    unless company.nil?
      duplicate = RecentQuote.where(user_id: params[:user_id], company_id: company.id)
      duplicate[0].destroy unless duplicate[0].nil?

      @recent_quote = RecentQuote.new(user_id: user_id, company_id: company.id)

	    if @recent_quote.save 
	      render json: @recent_quote
	    else
	      render :json => @recent_quote.errors, :status => :unprocessable_entity
	    end
    end

  end

  #later can figure out how to send errors back up to backbone
  #how am I going to redirect the user ?

  #<RecentQuote id: nil, user_id: nil, company_id: nil, created_at: nil, updated_at: nil>

end