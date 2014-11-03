class Api::CompaniesController < ApplicationController
  # def show
  #   @company = Company.find(params[:id])
  #   @comments = @company.quotes
  #   @price_graph_data_hash = @company.price_graph_data_hash
    
  #   render "show"
  # end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def index
    @companies = Company.all
    render json: @companies
  end
end
