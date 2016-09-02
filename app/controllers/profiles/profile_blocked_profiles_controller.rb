class Profiles::ProfileBlockedProfilesController < Inheritance::ProfileMatchesUserController
  before_action :get_blocked_profiles, only: :index
  before_action :get_blocked_profile, only: :destroy

  def index
  end

  def create
  end

  def destroy
    name = @profile_blocked_profile.blocked_profile.first_name
    @profile_blocked_profile.destroy
    flash[:success] = "Unblocked #{name}"
    redirect_to profile_profile_blocked_profiles_path(@profile)
  end

  private
  def get_blocked_profiles
    @profile_blocked_profiles = @profile.profile_blocked_profiles
  end

  def get_blocked_profile
    @profile_blocked_profile = ProfileBlockedProfile.find(params[:id])
    if !@profile.profile_blocked_profiles.include?(@profile_blocked_profile)
      flash[:error] = "Unauthorized"
      redirect_to profile_profile_blocked_profiles_path(@profile)
    else
      return @profile_blocked_profile
    end
  end
end
