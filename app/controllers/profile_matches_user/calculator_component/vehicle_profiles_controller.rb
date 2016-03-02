class ProfileMatchesUser::CalculatorComponent::VehicleProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_transportation_profile
  before_action :get_transportation_footprint
  before_action :get_vehicle_profile, except: [:new, :create]

  def new
    @vehicle_profile = VehicleProfile.new
  end

  def create
    create_vehicle_profile(vehicle_profile_params)
  end

  def show
  end

  def edit
  end

  def update
    update_vehicle_profile(vehicle_profile_params)
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

  def create_vehicle_profile(params)
    @vehicle_profile = VehicleProfile.new(params)
    if @vehicle_profile.save
      emissions = @vehicle_profile.calculate_emissions
      @vehicle_profile.update(sub_section_emissions: emissions)
      @transportation_profile.update(vehicle_emissions: emissions)
      @transportation_profile.check_for_completion
      @transportation_profile.calculate_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_profile_public_transportation_profile_path(transportation_profile_id: @transportation_profile.id)
    else
      render :new
    end
  end

  def update_vehicle_profile(params)
    if @vehicle_profile.update(params)
      emissions = @vehicle_profile.calculate_emissions
      @vehicle_profile.update(sub_section_emissions: emissions)
      @transportation_profile.update(vehicle_emissions: emissions)
      @transportation_profile.check_for_completion
      @transportation_profile.calculate_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_profile_public_transportation_profile_path(transportation_profile_id: @transportation_profile.id)
    else
      render :edit
    end
  end
end
