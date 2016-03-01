class ProfileMatchesUser::CalculatorComponent::WasteProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_waste_profile, except: [:new, :create]

  def new
    @waste_profile = WasteProfile.new
  end

  def create
    create_waste_profile(waste_profile_params)
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
  def get_waste_profile
    @waste_profile = WasteProfile.find(params[:id])
  end

  def waste_profile_params
    params.fetch(:waste_profile, {}).permit(:glass, :metal, :plastic, :newspaper, :magazines).merge(footprint_id: @footprint.id)
  end

  def create_waste_profile(params)
    @waste_profile = WasteProfile.new(params)
    if @waste_profile.save
      emissions = @waste_profile.calculate_emissions
      @waste_profile.update(section_emissions: emissions)
      @footprint.update(waste_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Waste emissions: #{emissions}lbs of CO2e"
      redirect_to footprint_create_transportation_profile_path(footprint_id: @footprint.id)
    else
      render :new
    end
  end 
end
