class Inheritance::CalculatorComponentsController < Inheritance::CompletedProfileController
  layout "calculator"

  protected
  def get_footprint
    @footprint = Footprint.find(params[:footprint_id])
  end
  
  def ensure_footprint_belongs_to_user
    unless @user.profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to root_path
    end
  end

  def next_component_path
    
  end 
end