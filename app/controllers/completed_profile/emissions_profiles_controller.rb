class ProfileMatchesUser::EmissionsProfilesController < ProfileMatchesUserController
  def index
  end

  def create
    create_emissions_profile
  end

  def show
  end

  def destroy
  end

  private
  def create_emissions_profile
    emissions_profile = @profile.emissions_profiles.create
    flash[:calculator_message] = "Created new footprint profile!"
    redirect_to new_profile_emissions_profile_diet_profile_path(profile_id: @profile.id, emissions_profile_id: emissions_profile.id)
  end
end
