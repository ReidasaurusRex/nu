class ProfileMatchesUser::CalculatorComponent::WaterProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_water_profile, except: [:new, :create]
  def new
    @water_profile = WaterProfile.new
  end

  def create
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
  def get_water_profile
    @water_profile = WaterProfile.find(params[:id])
  end
end
