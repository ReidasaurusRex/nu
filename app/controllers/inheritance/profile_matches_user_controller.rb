class Inheritance::ProfileMatchesUserController < Inheritance::CompletedProfileController
  before_action :get_profile_from_profile_id
  before_action :ensure_user_owns_profile

  protected

  def ensure_user_owns_profile
    unless @profile == @user.profile
      flash[:error] = "Profile doesn't match user profile"
      redirect_to root_path
    end
  end
end