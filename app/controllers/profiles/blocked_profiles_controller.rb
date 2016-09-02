class Profiles::BlockedProfilesController < Inheritance::ProfileMatchesUserController
  before_action :get_blocked_profiles, only: :index
  before_action :get_blocked_profile, only: :destroy

  def index
  end

  def create
  end

  def destroy
  end

  private
  def get_blocked_users
    @blocked_profiles = @profile.blocked_profiles
  end

  def get_blocked_user
    @blocked_profile = BlockedProfile.find(params[:id])
  end
end
