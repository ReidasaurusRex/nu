class ProfileMatchesUser::FootprintsController < CompletedProfileController
  before_action :get_footprint, only: [:show, :destroy]

  def index
  end

  def create
    create_footprint
  end

  def show
  end

  def destroy
  end

  private
  def create_footprint
    footprint = @profile.footprints.create
    redirect_to new_profile_footprint_diet_profile_path(profile_id: @profile.id, footprint_id: footprint.id)
  end

  def get_footprint
    @footprint = Footprint.find(params[:id])
  end

  def check_that_footprint_is_users
    profile = @user.profile
    unless profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to root_path
    end 
  end
end
