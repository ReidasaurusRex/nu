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

  def transportation_link
  end

  def home_energy_link
  end
end