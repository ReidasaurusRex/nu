class Inheritance::CalculatorComponentsController < Inheritance::CompletedProfileController
  layout "calculator"

  protected
  def get_footprint
    @footprint = Footprint.find(params[:footprint_id])
  end
  
  def ensure_footprint_belongs_to_profile
    if !@profile.footprints.include?(@footprint)
      flash[:error] = "Unauthorized"
      redirect_to profile_stats_path(@profile)
    end
  end

  def next_component_path(current_section)
    if current_section.has_attribute?(:transportation_id)
      return new_transportation_vehicle_path(transportation_id: @transportation.id) unless @transportation.vehicle
      return new_transportation_public_transportation_path(transportation_id: @transportation.id) unless @transportation.public_transportation
      return new_transportation_air_travel_path(transportation_id: @transportation.id) unless @transportation.air_travel
    end
    return new_footprint_diet_path(footprint_id: @footprint.id) unless @footprint.diet
    return new_footprint_water_path(footprint_id: @footprint.id) unless @footprint.water
    return new_footprint_waste_path(footprint_id: @footprint.id) unless @footprint.waste
    return footprint_create_transportation_path(footprint_id: @footprint.id) unless @footprint.transportation
    return new_footprint_home_energy_path(footprint_id: @footprint.id) unless @footprint.home_energy
    return profile_footprint_path(profile_id: @footprint.profile.id, id: @footprint.id)
  end 
end