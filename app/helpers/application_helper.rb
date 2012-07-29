module ApplicationHelper
  def current_user
    User.find_by_id(session[:user_id])
  end
end
