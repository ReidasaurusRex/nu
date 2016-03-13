class Inheritance::CompletedProfileController < Inheritance::LoggedInController
  before_action :ensure_completed_profile

  protected
  def ensure_completed_profile
    unless @user.profile
      flash[:error] = "Please complete your profile"
      redirect_to new_user_profile_path(@user)
    end
  end

  def get_profile_from_profile_id
    @profile = Profile.find(params[:profile_id])
  end
end