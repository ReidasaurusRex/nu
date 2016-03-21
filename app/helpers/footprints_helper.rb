module FootprintsHelper
  def footprint_section_summary(section)
    case section
    when "diet"
      if @footprint.diet
        render partial: "footprints/footprint_section_summary", locals: {section: @footprint.diet}
      else
        return "<h3>#{link_to('Assess diet', new_footprint_diet_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "water"
      if @footprint.water
        render partial: "footprints/footprint_section_summary", locals: {section: @footprint.water}
      else
        return "<h3>#{link_to('Assess water', new_footprint_water_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "waste"
      if @footprint.waste
        render partial: "footprints/footprint_section_summary", locals: {section: @footprint.waste}
      else
        return "<h3>#{link_to('Assess waste', new_footprint_waste_path(footprint_id: @footprint.id))}</h3>".html_safe
      end
    when "transportation"
      if @footprint.transportation
        render partial: "footprints/footprint_transportation_summary", locals: {transportation: @footprint.transportation}
      else
        return "<h3>#{proper_transportation_link(@footprint, @footprint.transportation)}</h3>".html_safe
      end
    when "home_energy"
      if @footprint.home_energy
        render partial: "footprints/footprint_home_energy_summary", locals: {home_energy: @footprint.home_energy}
      else
        return "<h3>#{proper_home_energy_link(@footprint, @footprint.home_energy)}"
      end
    end
  end

  def percent_of_total(footprint, section_emissions)
    if footprint.completed
      return "<h3>Percent of total emissions: #{((section_emissions/footprint.total_emissions)*100).to_i}%</h3>".html_safe
    end
  end
end
