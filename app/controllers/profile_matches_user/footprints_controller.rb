class ProfileMatchesUser::FootprintsController < ProfileMatchesUserController
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
  def create_footprint
    footprint = @profile.footprints.create
    redirect_to new_profile_emissions_profile_diet_profile_path(profile_id: @profile.id, emissions_profile_id: emissions_profile.id)
  end
end
