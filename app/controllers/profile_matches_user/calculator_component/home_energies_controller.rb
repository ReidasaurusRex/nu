class ProfileMatchesUser::CalculatorComponent::HomeEnergiesController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_home_energy, except: [:new, :create]

  def new
    @home_energy = HomeEnergy.new
  end

  def create
    binding.pry
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
end
