module FootprintsHelper
  def footprint_section_summary(section)
    case section
    when "diet"
      if @footprint.diet
        render partial: "profiles/footprints/footprint_section_summary", locals: {section: @footprint.diet, footprint: @footprint}
      else
        return "<h3>#{link_to('Assess diet', new_footprint_diet_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "water"
      if @footprint.water
        render partial: "profiles/footprints/footprint_section_summary", locals: {section: @footprint.water, footprint: @footprint}
      else
        return "<h3>#{link_to('Assess water', new_footprint_water_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "waste"
      if @footprint.waste
        render partial: "profiles/footprints/footprint_section_summary", locals: {section: @footprint.waste, footprint: @footprint}
      else
        return "<h3>#{link_to('Assess waste', new_footprint_waste_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "transportation"
      if @footprint.transportation
        render partial: "profiles/footprints/footprint_section_summary", locals: {section: @footprint.transportation, footprint: @footprint}
      else
        return "<h3>#{link_to 'Assess transportation', footprint_create_transportation_path(footprint_id: @footprint.id)}</h3>".html_safe
      end
    when "home_energy"
      if @footprint.home_energy
        render partial: "profiles/footprints/footprint_section_summary", locals: {section: @footprint.home_energy, footprint: @footprint}
      else
        return "<h3>#{link_to 'Assess home energy', new_footprint_home_energy_path(footprint_id: @footprint.id)}</h3>".html_safe
      end
    end
  end

  def percent_of_total(section, footprint)
    if footprint.complete?
      return ((section.section_emissions.to_f/footprint.total_emissions.to_f)*100).round
    else
      return "pending"
    end
  end

  def section_link_path(section, footprint)
    case section.class.name
    when "Diet"
      return link_to("View details", footprint_diet_path(footprint_id: footprint.id, id: section.id))
    when "Waste"
      return link_to("View details", footprint_waste_path(footprint_id: footprint.id, id: section.id))
    when "Water"
      return link_to("View details", footprint_water_path(footprint_id: footprint.id, id: section.id))
    when "Transportation"
      return link_to("View details", footprint_transportation_path(footprint_id: footprint.id, id: section.id))
    when "HomeEnergy"
      return link_to("View details", footprint_home_energy_path(footprint_id: footprint.id, id: section.id))
    end
  end
end
