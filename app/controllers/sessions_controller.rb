class SessionsController < ApplicationController
  before_action :require_signed_out!, :only => [:new, :create]
  before_action :require_signed_in!, :only => [:destroy]

  def new
    render :new, :layout => false
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )

    if @user
      sign_in(@user)
      #redirect_to static_pages_home_url
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new, :layout => false
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
