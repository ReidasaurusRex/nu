class ProfileMatchesUser::CalculatorComponent::UtilitiesController < Inheritance::CalculatorComponentsController
  before_action :get_home_energy
  before_action :get_footprint
  before_action :get_utilities

  def index
  end

  def update
    binding.pry
  end

  private
  def get_home_energy
    @home_energy = HomeEnergy.find(params[:home_energy_id])
  end

  def get_footprint
    @footprint = @home_energy.footprint
  end

  def get_utilities
    @utilities = @home_energy.utilities
  end
end
