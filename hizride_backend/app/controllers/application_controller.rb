class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # current_user näkyy kaikkialla
  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    u = User.find(session[:user_id])
  end
end
