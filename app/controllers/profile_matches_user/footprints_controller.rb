class ProfileMatchesUser::FootprintsController < ProfileMatchesUserController
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
    binding.pry
    redirect_to new_footprint_diet_profile_path(footprint)
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
