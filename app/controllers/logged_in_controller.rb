class LoggedInController < ApplicationController
  before_action :ensure_logged_in
  before_action :get_user


  protected
  def ensure_logged_in
    unless session[:user_id]
      flash[:error] = "Login or sign up!"
      redirect_to root_path
    end
  end

  def get_user
    @user = User.find(session[:user_id])
  end
end