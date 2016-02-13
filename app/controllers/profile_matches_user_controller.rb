class ProfileMatchesUserController < CompletedProfileController
  before_action :get_profile
  before_action :ensure_user_owns_profile

  protected
  def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def ensure_user_owns_profile
    unless @profile == @user.profile
      flash[:error] = "Unauthorized"
      redirect_to root_path
    end
  end
end