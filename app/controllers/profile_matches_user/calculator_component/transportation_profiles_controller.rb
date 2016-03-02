class ProfileMatchesUser::CalculatorComponent::TransportationProfilesController < ProfileMatchesUser::CalculatorComponentsController
  before_action :get_footprint
  before_action :get_transportation_profile, except: :create

  def create
    create_transportation_profile
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
  def get_transportation_profile
    @transportation_profile = TransportationProfile.find(params[:id])
  end

  def create_transportation_profile
    trans_prof = TransportationProfile.new(footprint_id: @footprint.id)
    if trans_prof.save
      redirect_to new_transportation_profile_vehicle_profile_path(transportation_profile_id: trans_prof.id)
    else
      flash[:error] = "Something went wrong"
      redirect_to root_path
    end
  end
end
