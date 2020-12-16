class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :events_attendance, :events_created

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorization
    redirect_to login_path alert: 'Sign in' unless logged_in?
  end
end
