class FollowsController < ApplicationController

  def create
  	follower_id = params[:user_id]
    leader_id = params[:follow][:leader_id]

  	Follow.create(follower_id: follower_id, leader_id: leader_id)

    redirect_to user_url(leader_id)
  end

  def destroy
    follower_id = params[:user_id]
    leader_id = params[:follow][:leader_id]
    follow = Follow.where(follower_id: follower_id, leader_id: leader_id)[0]
    follow.destroy
    redirect_to user_url(leader_id)
  end

  def index
  	user = User.find(params[:user_id])
    @users = user.users_they_follow
    render :index
  end

end
