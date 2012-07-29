class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authenticate_user

  def authenticate_user
    @current_user = User.find_by_id(session[:user_id])
    redirect_to '/login' unless @current_user
  end
end
