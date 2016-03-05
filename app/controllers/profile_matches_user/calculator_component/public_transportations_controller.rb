class ProfileMatchesUser::CalculatorComponent::PublicTransportationProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_transportation_profile
  before_action :get_transportation_footprint
  before_action :get_public_transportation_profile, except: [:new, :create]

  def new
    @public_transportation_profile = PublicTransportationProfile.new
  end

  def create
    create_public_transportation_profile(public_transportation_profile_params)
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
  def get_transportation_profile
    @transportation_profile = TransportationProfile.find(params[:transportation_profile_id])
  end

  def get_transportation_footprint
    @footprint = @transportation_profile.footprint
  end

  def get_public_transportation_profile
    @public_transportation_profile = PublicTransportationProfile.find(params[:id])
  end

  def public_transportation_profile_params
    params.fetch(:public_transportation_profile, {}).permit(:use, :metro, :commuter, :inter_city, :bus, :taxi).merge(transportation_profile_id: @transportation_profile.id)
  end

  def create_public_transportation_profile(params)
    @public_transportation_profile = PublicTransportationProfile.new(params)
    if @public_transportation_profile.save
      emissions = @public_transportation_profile.calculate_emissions
      @public_transportation_profile.update(sub_section_emissions: emissions)
      @transportation_profile.update(public_emissions: emissions)
      @transportation_profile.check_for_completion
      @transportation_profile.calculate_emissions
      flash[:calculator_message] = "Public transportation emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_profile_air_travel_profile_path(transportation_profile_id: @transportation_profile.id)
    else
      render :new
    end
  end
end
