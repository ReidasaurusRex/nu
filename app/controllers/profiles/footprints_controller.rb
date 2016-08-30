class Profiles::FootprintsController < Inheritance::ProfileMatchesUserController
  layout "calculator", except: :index

  before_action :get_footprint, only: [:show, :destroy]
  before_action :ensure_footprint_belongs_to_user, except: [:index, :create]

  def index
    @footprints = @profile.footprints
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
    redirect_to new_footprint_diet_path(footprint)
  end

  def get_footprint
    @footprint = Footprint.find(params[:id])
  end

  def ensure_footprint_belongs_to_user
    unless @profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to profile_stats_path(@profile)
    end 
  end
end
