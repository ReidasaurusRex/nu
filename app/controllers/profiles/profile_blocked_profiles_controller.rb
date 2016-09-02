class Profiles::ProfileBlockedProfilesController < Inheritance::ProfileMatchesUserController
  before_action :get_blocked_profiles, only: :index
  before_action :get_blocked_profile, only: :destroy

  def index
  end

  def create
  end

  def destroy
  end

  private
  def get_blocked_profiles
    @blocked_profiles = @profile.profile_blocked_profiles
  end

  def get_blocked_profile
    @profile_blocked_profile = ProfileBlockedProfile.find(params[:id])
  end
end
