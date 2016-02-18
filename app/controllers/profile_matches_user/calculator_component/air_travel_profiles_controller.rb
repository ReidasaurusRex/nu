class ProfileMatchesUser::CalculatorComponent::AirTravelProfilesController < ProfileMatchesUser::CalculatorComponentsController
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
  def get_air_travel_profile
    @air_travel_profile = AirTravelProfile.find(params[:id])
  end
end
