class Oauth::GithubController < ApplicationController
  include ApplicationHelper
  skip_before_filter :authenticate_user

  def new
    if Rails.env == "development"
      user = User.find_or_create_by_username(:username => "test", :avatar_url => "/assets/logos/octocat.png")
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to Providers::Github.new(current_user).authorize_uri(request)
    end
  end

  def create
    provider = Providers::Github.new(current_user)
    if user = provider.find_or_create_user(params[:code], request)
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login', :error => 'Could not log you in, please try again'
    end
  end

end
