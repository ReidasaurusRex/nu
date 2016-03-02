module CalculatorHelper
  def diet_link(footprint)
    if footprint.diet_profile
      return link_to("Diet", footprint_diet_profile_path(footprint_id: footprint.id, id: footprint.diet_profile.id))
    else
      return link_to("Diet", new_footprint_diet_profile_path(footprint_id: footprint.id))
    end
  end

  def water_link(footprint)
    if footprint.water_profile
      return link_to("Water", footprint_water_profile_path(footprint_id: footprint.id, id: footprint.water_profile.id))
    else
      return link_to("Water", new_footprint_water_profile_path(footprint_id: footprint.id))
    end
  end 

  def waste_link(footprint)
    if footprint.waste_profile
      return link_to("Waste", footprint_waste_profile_path(footprint_id: footprint.id, id: footprint.waste_profile.id))
    else
      return link_to("Waste", new_footprint_waste_profile_path(footprint_id: footprint.id))
    end
  end

  def transportation_link(footprint)
    unless footprint.transportation_profile
      return link_to("Transportation", footprint_create_transportation_profile_path(footprint_id: footprint.id))
    else
      transportation = footprint.transportation_profile
      if !transportation.vehicle_emissions
        return link_to("Transportation", new_transportation_profile_vehicle_profile_path(transportation_profile_id: transportation.id))
      elsif !transportation.public_emissions
        return link_to("Transportation", new_transportation_profile_public_transportation_profile_path(transportation_profile_id: transportation.id))
      elsif !transportation.air_emissions
        return link_to("Transportation", new_transportation_profile_air_travel_profile_path(transportation_profile_id: transportation.id))
      else
        return link_to("Transportation", footprint_transportation_profile_path(footprint_id: footprint.id, id: transportation.id))
      end
    end
  end

  def home_energy_link(footprint)
  end
end