class Api::CompaniesController < ApplicationController

  def show
    @company = Company.find(params[:id])
    @price_graph_data_hash = @company.price_graph_data_hash
    render "show"
  end

  def index
    @companies = Company.all
    render json: @companies
  end
  
end
