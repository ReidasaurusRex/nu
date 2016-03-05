module CalculatorHelper
  def diet_link(footprint)
    if footprint.diet
      return link_to("Diet", footprint_diet_path(footprint_id: footprint.id, id: footprint.diet.id))
    else
      return link_to("Diet", new_footprint_diet_path(footprint_id: footprint.id))
    end
  end

  def water_link(footprint)
    if footprint.water
      return link_to("Water", footprint_water_path(footprint_id: footprint.id, id: footprint.water.id))
    else
      return link_to("Water", new_footprint_water_path(footprint_id: footprint.id))
    end
  end 

  def waste_link(footprint)
    if footprint.waste
      return link_to("Waste", footprint_waste_path(footprint_id: footprint.id, id: footprint.waste.id))
    else
      return link_to("Waste", new_footprint_waste_path(footprint_id: footprint.id))
    end
  end

  def transportation_link(footprint)
    unless footprint.transportation
      return link_to("Transportation", footprint_create_transportation_path(footprint_id: footprint.id))
    else
      transportation = footprint.transportation
      if !transportation.vehicle_emissions
        return link_to("Transportation", new_transportation_vehicle_path(transportation_id: transportation.id))
      elsif !transportation.public_emissions
        return link_to("Transportation", new_transportation_public_transportation_path(transportation_id: transportation.id))
      elsif !transportation.air_emissions
        return link_to("Transportation", new_transportation_air_travel_profile_path(transportation_id: transportation.id))
      else
        return link_to("Transportation", footprint_transportation_path(footprint_id: footprint.id, id: transportation.id))
      end
    end
  end

  def home_energy_link(footprint)
  end
end