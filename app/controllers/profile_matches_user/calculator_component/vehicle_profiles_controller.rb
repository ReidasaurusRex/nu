class ProfileMatchesUser::CalculatorComponent::VehicleProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_transportation_profile
  before_action :get_transportation_footprint
  before_action :get_vehicle_profile, except: [:new, :create]

  def new
    @vehicle_profile = VehicleProfile.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_transportation_profile
    @transportation_profile = TransportationProfile.find(params[:transportation_profile_id])
  end

  def get_transportation_footprint
    @footprint = @transportation_profile.footprint
  end

  def get_vehicle_profile
    @vehicle_profile = VehicleProfile.find(params[:id])
  end

  def vehicle_profile_params
    params.fetch(:vehicle_profile, {}).permit(:have, :vehicle_type, :fuel_type, :mmonth, :mpg).merge(transportation_profile_id: @transportation_profile.id)
  end
end
