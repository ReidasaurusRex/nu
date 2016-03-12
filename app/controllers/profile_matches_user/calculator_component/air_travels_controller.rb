class ProfileMatchesUser::CalculatorComponent::AirTravelsController < CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_air_travel, except: [:new, :create]

  def new
    @air_travel = AirTravel.new
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
  def get_transportation
    @transportation = Transportation.find(params[:transportation_id])
  end

  def get_transportation_footprint
    @footprint = @transportation.footprint
  end

  def get_air_travel
    @air_travel = AirTravel.find(params[:id])
  end

  def air_travel_params
    params.fetch(:air_travel, {}).permit(:d_economy, :d_business, :i_economy, :i_premium_economy, :i_business, :i_first).merge(transportation_id: @transportation.id)
  end 
end
