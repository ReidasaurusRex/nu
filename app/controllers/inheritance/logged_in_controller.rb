class Inheritance::LoggedInController < ApplicationController
  before_action :ensure_logged_in

  protected
  def ensure_logged_in
    unless session[:user_id]
      flash[:error] = "Login or sign up!"
      redirect_to root_path
    end
  end
end