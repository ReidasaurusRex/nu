module CalculatorHelper
  def diet_link(footprint)
    if footprint.diet
      return link_to(image_tag(footprint.diet.image_path), footprint_diet_path(footprint_id: footprint.id, id: footprint.diet.id)).html_safe
    else
      return link_to(image_tag("progress_icons/grayscale/diet"), new_footprint_diet_path(footprint_id: footprint.id)).html_safe
    end
  end

  def water_link(footprint)
    if footprint.water
      return link_to(image_tag(footprint.water.image_path), footprint_water_path(footprint_id: footprint.id, id: footprint.water.id)).html_safe
    else
      return link_to(image_tag("progress_icons/grayscale/water"), new_footprint_water_path(footprint_id: footprint.id)).html_safe
    end
  end 

  def waste_link(footprint)
    if footprint.waste
      return link_to(image_tag(footprint.waste.image_path), footprint_waste_path(footprint_id: footprint.id, id: footprint.waste.id)).html_safe
    else
      return link_to(image_tag("progress_icons/grayscale/waste"), new_footprint_waste_path(footprint_id: footprint.id)).html_safe
    end
  end

  def transportation_link(footprint)
    unless footprint.transportation
      return link_to(image_tag("progress_icons/grayscale/transportation"), footprint_create_transportation_path(footprint_id: footprint.id)).html_safe
    else
      transportation = footprint.transportation
      if !transportation.vehicle_emissions
        return link_to(image_tag(transportation.image_path), new_transportation_vehicle_path(transportation_id: transportation.id)).html_safe
      elsif !transportation.public_emissions
        return link_to(image_tag(transportation.image_path), new_transportation_public_transportation_path(transportation_id: transportation.id)).html_safe
      elsif !transportation.air_emissions
        return link_to(image_tag(transportation.image_path), new_transportation_air_travel_path(transportation_id: transportation.id)).html_safe
      else
        return link_to(image_tag(transportation.image_path), footprint_transportation_path(footprint_id: footprint.id, id: transportation.id)).html_safe
      end
    end
  end

  def home_energy_link(footprint)
    unless footprint.home_energy
      return link_to(image_tag("progress_icons/grayscale/home_energy"), new_footprint_home_energy_path(footprint_id: footprint.id)).html_safe
    else
      return link_to(image_tag(footprint.home_energy.image_path), footprint_home_energy_path(footprint_id: footprint.id, id: footprint.home_energy.id)).html_safe
    end
  end
end