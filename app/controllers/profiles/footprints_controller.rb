class Profiles::FootprintsController < Inheritance::ProfileMatchesUserController
  layout "calculator", except: [:new, :index]

  before_action :get_footprint, only: [:show, :destroy]
  before_action :ensure_footprint_belongs_to_user, except: [:index, :new, :create]
  before_action :redirect_if_incomplete, only: :show

  def index
    @footprints = @profile.footprints.order(created_at: :desc)
  end

  def new
    @footprint = Footprint.new
  end

  def create
    create_footprint
  end

  def show
  end

  def destroy
  end

  private
  def create_footprint
    footprint = @profile.footprints.create
    redirect_to footprint_create_transportation_path(footprint)
  end

  def get_footprint
    @footprint = Footprint.find(params[:id])
  end

  def ensure_footprint_belongs_to_user
    unless @profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to profile_stats_path(@profile)
    end 
  end

  def redirect_if_incomplete
    if !@footprint.complete?
      redirect_to footprint_create_transportation_path(footprint_id: @footprint.id) and return unless @footprint.transportation
      redirect_to new_transportation_vehicle_path(transportation_id: @footprint.transportation.id) and return unless @footprint.transportation.vehicle
      redirect_to new_transportation_public_transportation_path(transportation_id: @footprint.transportation.id) and return unless @footprint.transportation.public_transportation
      redirect_to new_transportation_air_travel_path(transportation_id: @footprint.transportation.id) and return unless @footprint.transportation.air_travel
      redirect_to new_footprint_home_energy_path(footprint_id: @footprint.id) and return unless @footprint.home_energy
      redirect_to new_footprint_water_path(footprint_id: @footprint.id) and return unless @footprint.water
      redirect_to new_footprint_waste_path(footprint_id: @footprint.id) and return unless @footprint.waste
      redirect_to new_footprint_diet_path(footprint_id: @footprint.id) and return unless @footprint.diet
    end
  end
end
