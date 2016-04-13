class Profile::StatsController < Inheritance::CompletedProfileController
  before_action :get_profile_from_profile_id
  
  def index
    @footprints = @profile.footprints
  end
end
