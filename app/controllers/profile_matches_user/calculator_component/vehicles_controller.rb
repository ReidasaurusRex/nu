class ProfileMatchesUser::CalculatorComponent::VehiclesController < CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_vehicle, except: [:new, :create]

  def new
    @vehicle = Vehicle.new
  end

  def create
    create_vehicle(vehicle_params)
  end

  def show
  end

  def edit
  end

  def update
    update_vehicle(vehicle_params)
  end

  def destroy
  end

  private
  def get_transportation
    @transportation = Transportation.find(params[:transportation_id])
  end

  def get_transportation_footprint
    @footprint = @transportation.footprint
  end

  def get_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.fetch(:vehicle, {}).permit(:have, :vehicle_type, :fuel_type, :mmonth, :mpg).merge(transportation_id: @transportation.id)
  end

  def create_vehicle(params)
    @vehicle = Vehicle.new(params)
    if @vehicle.save
      emissions = @vehicle.calculate_emissions
      @vehicle.update(sub_section_emissions: emissions)
      @transportation.update(vehicle_emissions: emissions)
      @transportation.check_for_completion
      @transportation.calculate_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_public_transportation_path(transportation_id: @transportation.id)
    else
      render :new
    end
  end

  def update_vehicle(params)
    if @vehicle.update(params)
      emissions = @vehicle.calculate_emissions
      @vehicle.update(sub_section_emissions: emissions)
      @transportation.update(vehicle_emissions: emissions)
      @transportation.check_for_completion
      @transportation.calculate_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_public_transportation_path(transportation_id: @transportation.id)
    else
      render :edit
    end
  end
end
