class Profiles::Footprints::HomeEnergiesController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :ensure_footprint_belongs_to_profile
  before_action :get_home_energy, except: [:new, :create]

  def new
    @home_energy = HomeEnergy.new
  end

  def create
    create_home_energy(utility_list_params)
  end

  def show
  end

  def edit
  end

  def update
    update_home_enegy(utility_list_params)
  end

  def destroy
  end

  private
  def get_home_energy
    @home_energy = HomeEnergy.find(params[:id])
    binding.pry
    if !@home_energy == @footprint.home_energy
      flash[:error] = "Unauthorized"
      redirect_to profile_footprint_path(profile_id: @profile.id, id: @footprint.id)
    end
  end

  def utility_list_params
    params.fetch(:utilities, {}).permit(:natural_gas, :fuel_oil, :propane, :electricity)
  end

  def create_home_energy(utilities)
    @home_energy = HomeEnergy.create(footprint_id: @footprint.id)
    @home_energy.create_utilities(utilities)
    redirect_to home_energy_utilities_path(home_energy_id: @home_energy.id)
  end

  def update_home_enegy(utilities)
    @home_energy.create_utilities(utilities)
    redirect_to home_energy_utilities_path(home_energy_id: @home_energy.id)
  end
end
