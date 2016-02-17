class CompletedProfile::EmissionsProfilesController < ProfileMatchesUserController
  def index
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
  def create_emissions_profile
    emissions_profile = @profile.emissions_profiles.create
    redirect_to new_
  end
end
