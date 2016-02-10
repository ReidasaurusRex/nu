class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def get_profile_from_profile_id
    @profile = Profile.find(params[:profile_id])
  end

  def get_emissions_profile_from_emission_profile_id
    @emissions_profile = EmissionsProfile.find(params[:emissions_profile_id])
  end

  def ensure_profile_is_users
    user = User.find(session[:user_id])
    if user.profile
      unless @profile == user.profile
        flash[:error] = "You can't access that"
        redirect_to user_profile_path(user_id: session[:user_id], id: user.profile.id)
      end
    else
      flash[:error] = "Please create a profile"
      redirect_to new_user_profile_path(user_id: user.id)
    end
  end
end
