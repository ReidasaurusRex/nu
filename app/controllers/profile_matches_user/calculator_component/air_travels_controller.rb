class ProfileMatchesUser::CalculatorComponent::AirTravelProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_transportation_profile
  before_action :get_transportation_footprint
  before_action :get_air_travel_profile, except: [:new, :create]

  def new
    @air_travel_profile = AirTravelProfile.new
  end

  def create
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

  def get_air_travel_profile
    @air_travel_profile = AirTravelProfile.find(params[:id])
  end

  def air_travel_profile_params
    params.fetch(:air_travel_profile, {}).permit(:d_economy, :d_business, :i_economy, :i_premium_economy, :i_business, :i_first).merge(transportation_profile_id: @transportation_profile.id)
  end 
end
