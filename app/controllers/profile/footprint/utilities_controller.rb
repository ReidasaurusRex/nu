class Profile::Footprint::UtilitiesController < Inheritance::CalculatorComponentsController
  before_action :get_home_energy
  before_action :get_footprint
  before_action :get_utilities

  def index
  end

  def update
    update_utilities
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

  def update_utilities
    @utilities.each do |utility|
      utility_params = params[:utilities].select{|key, value| key == utility.id.to_s}["#{utility.id}"]
      utility.update(utility_params.permit(:known, :input_amount, :input_type))
    end
    if @utilities.all?{|utility| utility.valid?(:update)}
      home_energy_emissions = 0
      @utilities.each do |utility|
        emissions = utility.calculate_emissions
        utility.update(sub_section_emissions: emissions)
        home_energy_emissions += emissions
      end
      @home_energy.update_emissions(home_energy_emissions)
      flash[:calculator_message] = "Home energy emissions: #{home_energy_emissions}lbs of CO2e"
      redirect_to next_component_path(@utilities.sample)
    else
      render :index
    end
  end
end
