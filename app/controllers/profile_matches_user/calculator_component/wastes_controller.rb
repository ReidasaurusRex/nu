class ProfileMatchesUser::CalculatorComponent::WastesController < CalculatorComponentsController
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
      @waste.update(section_emissions: emissions)
      @footprint.update(waste_emissions: emissions)
      @footprint.check_for_completion
      flash[:calculator_message] = "Waste emissions: #{emissions}lbs of CO2e"
      redirect_to footprint_create_transportation_path(footprint_id: @footprint.id)
    else
      render :new
    end
  end 
end
