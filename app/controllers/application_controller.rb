class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Expose these methods to the views
  helper_method :current_user, :signed_in?

  private

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end

  def sign_out
    current_user.try(:reset_session_token!)
    session[:token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def require_signed_out!
    redirect_to user_url(current_user) if signed_in?
  end

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
