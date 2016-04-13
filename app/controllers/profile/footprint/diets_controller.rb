class Profile::Footprint::DietsController < Inheritance::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_diet, except: [:new, :create]
  before_action :ensure_footprint_belongs_to_user

  def new
    @diet = Diet.new
  end

  def create
    create_diet(diet_params)
  end

  def show
  end

  def edit
  end

  def update
    update_diet(diet_params)
  end

  def destroy
  end

  private
  def get_diet
    @diet = Diet.find(params[:id])
  end

  def diet_params
    params.fetch(:diet, {}).permit(:diet_type).merge(footprint_id: params[:footprint_id])
  end

  def create_diet(params)
    @diet = Diet.new(params)
    if @diet.save
      prior_footprint_completion = @footprint.complete?
      emissions = @diet.calculate_emissions
      @diet.update(section_emissions: emissions)
      @footprint.update(diet_emissions: emissions)
      @footprint.update_total_if_complete
      @footprint.post_if_first_completion(prior_footprint_completion)
      flash[:calculator_message] = "Diet emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@diet)
    else
      render :new
    end
  end

  def update_diet(params)
    if @diet.update(params)
      emissions = @diet.calculate_emissions
      @diet.update(section_emissions: emissions)
      @footprint.update(diet_emissions: emissions)
      @footprint.update_total_if_complete
      flash[:calculator_message] = "Diet emissions: #{emissions}lbs CO2e"
      redirect_to next_component_path(@diet)
    else
      render :edit
    end
  end
end
