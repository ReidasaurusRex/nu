class Profile::CalculatorComponent::WastesController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_waste, except: [:new, :create]
  before_action :ensure_footprint_belongs_to_user

  def new
    @waste = Waste.new
  end

  def create
    create_waste(waste_params)
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
  def get_waste
    @waste = Waste.find(params[:id])
  end

  def waste_params
    params.fetch(:waste, {}).permit(:glass, :metal, :plastic, :newspaper, :magazines).merge(footprint_id: @footprint.id)
  end

  def create_waste(params)
    @waste = Waste.new(params)
    if @waste.save
      emissions = @waste.calculate_emissions
      prior_footprint_completion = @footprint.complete?
      @waste.update(section_emissions: emissions)
      @footprint.update(waste_emissions: emissions)
      @footprint.update_total_if_complete
      @footprint.post_if_first_completion(prior_footprint_completion)
      flash[:calculator_message] = "Waste emissions: #{emissions}lbs of CO2e"
      redirect_to next_component_path(@waste)
    else
      render :new
    end
  end 
end
