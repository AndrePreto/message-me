class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id].present?
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?
    flash[:error] = 'You must be logged in to perform that action'
    redirect_to login_path
  end
  
end
