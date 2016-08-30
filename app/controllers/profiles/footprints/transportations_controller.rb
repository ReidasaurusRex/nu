class Profiles::Footprints::TransportationsController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :ensure_footprint_belongs_to_profile
  before_action :get_transportation, except: :create

  def create
    create_transportation
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
    @transportation = Transportation.find(params[:id])
    if @transportation != @footprint.transportation
      flash[:error] = "Unauthorized"
      redirect_to profile_footprint_path(profile_id: @profile.id, id: @footprint.id)
    end
  end

  def create_transportation
    transportation = Transportation.new(footprint_id: @footprint.id)
    if transportation.save
      redirect_to new_transportation_vehicle_path(transportation_id: transportation.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end
end
