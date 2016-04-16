class AccessController < ApplicationController
  before_action :redirect_if_logged_in, only: :landing
  def landing
    flash.keep
  end

  def login
    attempt_user_login(params[:email], params[:password])
  end

  def logout
    logout_user
  end

  private
  def attempt_user_login(email=nil, password=nil)
    if email.present? && password.present?
      found_user = User.find_by(email: email)
      if found_user
        authorized_user = found_user.authenticate(password)
        if authorized_user
          session[:user_id] = authorized_user.id
          flash[:success] = "Welcome back!"
          redirect_to_new_profile_or_stats(authorized_user)
        else
          flash.now[:error] = "Incorrect email or password"
          render :landing
        end
      else
        flash.now[:error] = "Incorrect email or password"
        render :landing
      end
    else
      flash.now[:error] = "Please enter an email and password"
      render :landing
    end
  end

  def redirect_to_new_profile_or_stats(user)
    if user.profile
      redirect_to profile_newsfeed_items_path(user.profile.id)
    else
      redirect_to new_user_profile_path(user.id)
    end
  end

  def logout_user
    session[:user_id] = nil
    flash[:success] = "Aloha!"
    redirect_to root_path
  end

  def redirect_if_logged_in
    user = User.find(session[:user_id]) if session[:user_id]
    if user
      redirect_to_new_profile_or_stats(user)
    end
  end
end
