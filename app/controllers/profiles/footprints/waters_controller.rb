class Profiles::Footprints::WatersController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_water, except: [:new, :create]

  def new
    @water = Water.new
  end

  def create
    create_water(water_params)
  end

  def show
  end

  def edit
  end

  def update
    update_water(water_params)
  end

  def destroy
  end

  private
  def get_water
    @water = Water.find(params[:id])
    if @water != @footprint.water
      flash[:error] = "Unauthorized"
      redirect_to profile_footprint_path(profile_id: @profile.id, id: @footprint.id)
    end
  end

  def water_params
    params.require(:water).permit(:use, :known, :measurement_amount, :measurement_type).merge(footprint_id: @footprint.id)
  end

  def create_water(params)
    @water = Water.new(params)
    if @water.save
      emissions = @water.calculate_emissions
      prior_footprint_completion = @footprint.complete?
      @water.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.update_total_if_complete
      @footprint.post_and_score_if_first_completion(prior_footprint_completion)
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@water)
    else
      render :new
    end
  end

  def update_water(params)
    if @water.update(params)
      emissions = @water.calculate_emissions
      @water.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.update_total_if_complete
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@water)
    else
      render :edit
    end
  end
end
