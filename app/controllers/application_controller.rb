class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
