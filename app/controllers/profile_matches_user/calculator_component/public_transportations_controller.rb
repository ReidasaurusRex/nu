class ProfileMatchesUser::CalculatorComponent::PublicTransportationsController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_transportation
  before_action :get_transportation_footprint
  before_action :get_public_transportation, except: [:new, :create]

  def new
    @public_transportation = PublicTransportation.new
  end

  def create
    create_public_transportation(public_transportation_params)
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

  def get_public_transportation
    @public_transportation = PublicTransportation.find(params[:id])
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
      @transportation.check_for_completion
      @transportation.calculate_emissions
      flash[:calculator_message] = "Public transportation emissions: #{emissions}lbs CO2e"
      redirect_to new_transportation_air_travel_path(transportation_id: @transportation.id)
    else
      render :new
    end
  end
end
