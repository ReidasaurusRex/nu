class Inheritance::LoggedInController < ApplicationController
  before_action :ensure_logged_in

  protected
  def ensure_logged_in
    unless session[:user_id]
      flash[:error] = "Login or sign up!"
      redirect_to root_path
    end
  end

  def ensure_profile_matches_user
    unless @user.profile == @profile
      flash[:error] = "Unauthorized"
      redirect_to profile_path(@user.profile)
    end
  end
end