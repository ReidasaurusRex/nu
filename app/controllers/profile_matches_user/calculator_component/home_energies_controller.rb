class ProfileMatchesUser::CalculatorComponent::HomeEnergiesController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
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
  end

  def destroy
  end

  private
  def get_home_energy
    @home_energy = HomeEnergy.find(params[:id])
  end

  def utility_list_params
    params.fetch(:utilities, {}).permit(:natural_gas, :fuel_oil, :propane, :electricity)
  end

  def create_home_energy(utilities)
    @home_energy = HomeEnergy.create(footprint_id: @footprint.id)
    @home_energy.create_utilities(utilities)
    redirect_to home_energy_utilities_path(home_energy_id: @home_energy.id)
  end
end
