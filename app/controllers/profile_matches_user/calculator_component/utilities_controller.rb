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

  # def utilities_params  waiting on stack overflow
  #   params.require(:utilities[]).permit(:known, :input_amount, :input_type)
  # end

  def update_utilities
    @utilities.each do |utility|
      utility_params = params[:utilities].select{|key, value| key == utility.id}
      utility.update(utility_params)
      emissions = utility.calculate_emissions
      utility.udpate(sub_section_emissions: emissions)
    end
  end
end
