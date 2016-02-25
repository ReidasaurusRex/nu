class ProfileMatchesUser::CalculatorComponent::DietProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_diet_profile, except: [:new, :create]

  def new
    @diet_profile = DietProfile.new
  end

  def create
    create_diet_profile(diet_params)
  end

  def show
  end

  def edit
  end

  def update
    update_diet_profile(diet_params)
  end

  def destroy
  end

  private
  def get_diet_profile
    @diet_profile = DietProfile.find(params[:id])
  end

  def diet_params
    params.fetch(:diet_profile, {}).permit(:diet_type).merge(footprint_id: params[:footprint_id])
  end

  def create_diet_profile(params)
    @diet_profile = DietProfile.new(params)
    if @diet_profile.save
      emissions = @diet_profile.calculate_emissions
      @diet_profile.update(section_emissions: emissions)
      @footprint.update(diet_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Diet emissions: #{emissions}"
      redirect_to new_footprint_water_profile_path(@footprint)
    else
      render :new
    end
  end

  def update_diet_profile(params)
    if @diet_profile.update(params)
      emissions = @diet_profile.calculate_emissions
      @diet_profile.update(section_emissions: emissions)
      @footprint.update(diet_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Diet emissions: #{emissions}"
      redirect_to new_footprint_water_profile_path(@footprint)
    else
      render :edit
    end
  end
end
