module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorization
    redirect_to login_path unless logged_in?
  end
  
end
