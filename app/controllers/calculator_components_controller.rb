class CalculatorComponentsController < LoggedInController
  before_action :get_emissions_profile
  before_action :ensure_emissions_profile_belongs_to_user

  protected
  def get_emissions_profile
    @emissions_profile = EmissionsProfile.find(params[:emissions_profile_id])
  end
  def ensure_emissions_profile_belongs_to_user
    unless @user.profile.emissions_profiles.include?(@emissions_profile)
      flas[:error] = "Unauthorized"
      redirect_to root_path
    end
  end
end