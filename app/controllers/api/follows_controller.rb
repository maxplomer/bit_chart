class Api::FollowsController < ApplicationController

  def show
    @follow = Follow.find(params[:id])
    render json: @follow
  end

  def index
    @follows = Follow.all
    render json: @follows
  end

  def create
    @follow = Follow.new(
      follower_id: params["follower_id"],
      leader_id: params["leader_id"]
    )
    if @follow.save
      render json: @follow
    else
      render :json => @follow.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy!
    render json: @follow
  end

end