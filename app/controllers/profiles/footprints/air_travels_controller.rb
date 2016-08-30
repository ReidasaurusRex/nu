class Profiles::Footprints::AirTravelsController < Inheritance::CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_air_travel, except: [:new, :create]

  def new
    @air_travel = AirTravel.new
  end

  def create
    create_air_travel(air_travel_params)
  end

  def edit
  end

  def update
    update_air_travel(air_travel_params)
  end

  def destroy
  end

  private
  def get_transportation
    @transportation = Transportation.find(params[:transportation_id])
  end

  def get_transportation_footprint
    @footprint = @transportation.footprint
    if !@profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to profile_stats_path(@profile)
    end
  end

  def get_air_travel
    @air_travel = AirTravel.find(params[:id])
    if @transportation.air_travel != @air_travel
      flash[:error] = "Unauthorized"
      redirect_to footprint_transportation_path(footprint_id: @footprint.id, id: @transportation.id)
    end
  end

  def air_travel_params
    params.fetch(:air_travel, {}).permit(:d_economy, :d_business, :i_economy, :i_premium_economy, :i_business, :i_first).merge(transportation_id: @transportation.id)
  end 

  def create_air_travel(params)
    @air_travel = AirTravel.new(params)
    if @air_travel.save
      emissions = @air_travel.calculate_emissions
      @air_travel.update(sub_section_emissions: emissions)
      @transportation.update(air_emissions: emissions)
      @transportation.update_emissions
      flash[:calculator_message] = "Air travel emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@air_travel)
    else
      render :new
    end
  end

  def update_air_travel(params)
    if @air_travel.update(params)
    emissions = @air_travel.calculate_emissions
    @air_travel.update(sub_section_emissions: emissions)
    @transportation.update(air_emissions: emissions)
    @transportation.update_emissions
    flash[:calculator_message] = "Air travel emissions: #{emissions}lbs CO2e"
    redirect_to next_component_path(@air_travel)
    else
      render :edit
    end
  end
end
