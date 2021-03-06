class AboutController < ApplicationController
  before_action :get_profile_if_logged_in
  before_action :get_notifications_if_logged_in

  def general
  end

  def philosophy
  end

  def privacy
  end

  def data
  end

  def future
  end

  private

  def get_profile_if_logged_in
    if session[:user_id]
      @profile = User.find(session[:user_id]).profile
    end
  end

  def get_notifications_if_logged_in
    if @profile
      @notifications = @profile.notifications
    end
  end
end
