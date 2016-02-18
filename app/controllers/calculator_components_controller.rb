class ProfileMatchesUser::CalculatorComponentsController < CompletedProfileController
  before_action :get_footprint
  before_action :ensure_footprint_belongs_to_user
  layout :calculator

  protected
  def get_footprint
    @footprint = Footprint.find(params[:footprint_id])
  end
  def ensure_footprint_belongs_to_user
    unless @user.profile.footprints.include?(@footprint)
      flas[:error] = "Unauthorized"
      redirect_to root_path
    end
  end
end