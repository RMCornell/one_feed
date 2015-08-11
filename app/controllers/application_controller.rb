class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :twitter_user, :instagram_user

  def twitter_user
    current_user && current_user.twitter
  end

  def instagram_user
    current_user && current_user.instagram
  end
end
