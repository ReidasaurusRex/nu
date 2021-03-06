class Profiles::Footprints::PublicTransportationsController < Inheritance::CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_public_transportation, except: [:new, :create]

  def new
    @public_transportation = PublicTransportation.new
  end

  def create
    create_public_transportation(public_transportation_params)
  end

  def edit
  end

  def update
    update_public_transportation(public_transportation_params)
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

  def get_public_transportation
    @public_transportation = PublicTransportation.find(params[:id])
    if @public_transportation != @transportation.public_transportation
      flash[:error] = "Unauthorized"
      redirect_to footprint_transportation_path(footprint_id: @footprint.id, id: @transportation.id)
    end
  end

  def public_transportation_params
    params.fetch(:public_transportation, {}).permit(:use, :metro, :commuter, :inter_city, :bus, :taxi).merge(transportation_id: @transportation.id)
  end

  def create_public_transportation(params)
    @public_transportation = PublicTransportation.new(params)
    if @public_transportation.save
      emissions = @public_transportation.calculate_emissions
      @public_transportation.update(sub_section_emissions: emissions)
      @transportation.update(public_emissions: emissions)
      @transportation.update_emissions
      flash[:calculator_message] = "Public transportation emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@public_transportation)
    else
      render :new
    end
  end

  def update_public_transportation(params)
    if @public_transportation.update(params)
      emissions = @public_transportation.calculate_emissions
      @public_transportation.update(sub_section_emissions: emissions)
      @transportation.update(public_emissions: emissions)
      @transportation.update_emissions
      flash[:calculator_message] = "Public transportation emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@public_transportation)
    else
      render :edit
    end
  end
end
