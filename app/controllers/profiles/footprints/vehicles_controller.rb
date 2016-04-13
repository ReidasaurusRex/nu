class Profiles::Footprints::VehiclesController < Inheritance::CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_vehicle, except: [:new, :create]

  def new
    @vehicle = Vehicle.new
  end

  def create
    create_vehicle(vehicle_params)
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
      @transportation.update_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@vehicle)
    else
      render :new
    end
  end

  def update_vehicle(params)
    if @vehicle.update(params)
      emissions = @vehicle.calculate_emissions
      @vehicle.update(sub_section_emissions: emissions)
      @transportation.update(vehicle_emissions: emissions)
      @transportation.update_emissions
      flash[:calculator_message] = "Vehicle emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@vehicle)
    else
      render :edit
    end
  end
end
