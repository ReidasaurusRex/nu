class LoggedInController < ApplicationController
  before_action :ensure_logged_in

  protected
  def ensure_logged_in      
    unless session[:user_id]
      flash[:error] =  "Please log in"
      redirect_to root_path
    end
  end

end