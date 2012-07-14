class Oauth::SessionsController < ApplicationController

  skip_before_filter :authenticate_user

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
