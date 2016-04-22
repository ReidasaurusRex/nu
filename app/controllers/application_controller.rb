class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_user_if_logged_in

  protected
  def get_user_if_logged_in
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
