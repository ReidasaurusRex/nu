class Inheritance::ProfileMatchesUserController < Inheritance::CompletedProfileController
  before_action :get_profile
  before_action :ensure_user_owns_profile

  protected
  def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def ensure_user_owns_profile
    unless @profile == @user.profile
      flash[:error] = "Profile doesn't match user profile"
      redirect_to root_path
    end
  end
end