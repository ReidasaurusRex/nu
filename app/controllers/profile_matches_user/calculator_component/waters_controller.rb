class ProfileMatchesUser::CalculatorComponent::WaterProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_water_profile, except: [:new, :create]
  before_action :ensure_footprint_belongs_to_user

  def new
    @water_profile = WaterProfile.new
  end

  def create
    create_water_profile(water_profile_params)
  end

  def show
  end

  def edit
  end

  def update
    update_water_profile(water_profile_params)
  end

  def destroy
  end

  private
  def get_water_profile
    @water_profile = WaterProfile.find(params[:id])
  end

  def water_profile_params
    params.require(:water_profile).permit(:use, :known, :measurement_amount, :measurement_type).merge(footprint_id: @footprint.id)
  end

  def create_water_profile(params)
    @water_profile = WaterProfile.new(params)
    if @water_profile.save
      emissions = @water_profile.calculate_emissions
      @water_profile.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to new_footprint_waste_profile_path(@footprint)
    else
      render :new
    end
  end

  def update_water_profile(params)
    if @water_profile.update(params)
      emissions = @water_profile.calculate_emissions
      @water_profile.update(section_emissions: emissions)
      @footprint.update(water_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Water emissions: #{emissions}lbs CO2e"
      redirect_to profile_footprint_path(profile_id: @footprint.profile.id, id: @footprint.id)
    else
      render :edit
    end
  end
end
