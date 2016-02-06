class AccessController < ApplicationController
  def landing
  end

  def login
  end

  def logout
  end

  private
  def attempt_user_login(email=nil, password=nil)
    if email.present? && password.present?
      found_user = User.find_by(email: email)
      if found_user
        authorized_user = found_user.authenticate(password)
        if authorized_user
          session[:user_id] = authorized_user.user_id
          flash[:success] = "Welcome back!"
          redirect_to_new_profile_or_feed(authorized_user)
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

  def redirect_to_new_profile_or_feed(user)
    if user.profile.complete
      redirect_to profile_newsfeed_items_path(user.profile.id)
    else
      redirect_to new_user_profile_path(user.id)
    end
  end
end
