class ProfileMatchesUser::CalculatorComponent::WatersController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_water, except: [:new, :create]
  before_action :ensure_footprint_belongs_to_user

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
  end

  def water_params
    params.require(:water).permit(:use, :known, :measurement_amount, :measurement_type).merge(footprint_id: @footprint.id)
  end

  def create_water(params)
    @water = Water.new(params)
    if @water.save
      emissions = @water.calculate_emissions
      @water.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to new_footprint_waste_path(@footprint)
    else
      render :new
    end
  end

  def update_water(params)
    if @water.update(params)
      emissions = @water.calculate_emissions
      @water.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to profile_footprint_path(profile_id: @footprint.profile.id, id: @footprint.id)
    else
      render :edit
    end
  end
end
