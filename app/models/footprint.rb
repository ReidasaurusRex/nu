class Footprint < ActiveRecord::Base
  belongs_to :profile
  has_one :water, dependent: :destroy
  has_one :diet, dependent: :destroy
  has_one :waste, dependent: :destroy
  has_one :transportation, dependent: :destroy
  has_one :home_energy, dependent: :destroy

  def complete?
    if self.water_emissions && self.diet_emissions && self.transportation_emissions && self.waste_emissions && self.home_energy_emissions
      return true
    else
      return false
    end
  end

  def friendly_creation_date
    return self.created_at.strftime("%B %d, %Y")
  end

  def emissions_or_pending
    if self.total_emissions
      return "#{self.total_emissions}lbs CO2e"
    else
      return "Pending"
    end
  end

  def update_total_if_complete
    if self.complete?
      emissions = 0
      [self.diet_emissions, 
      self.water_emissions, 
      self.waste_emissions, 
      self.transportation_emissions, 
      self.home_energy_emissions].each{|section| emissions += section}
      self.update(total_emissions: emissions)
    end
  end

  def post_and_score_if_first_completion(prior_complete)
    if !prior_complete && self.complete?
      profile = self.profile
      profile.point_overview.add_score_from_footprint
      profile.newsfeed_items.create(source_type: "profile", source_id: profile.id, content: "#{profile.first_name.capitalize} checked out their carbon footprint, and it's at #{self.total_emissions}lbs of CO2e!")
      profile.post_to_followers("#{profile.first_name.capitalize} checked out their carbon footprint, and it's at #{self.total_emissions}lbs of CO2e!")
    end
  end

  def percent_of_us_allotment
    return ((self.total_emissions.to_f / 1980) * 100).round
  end

  def percent_progress
    progress = 0
    [self.diet_emissions, self.water_emissions, self.waste_emissions, self.transportation_emissions, self.home_energy_emissions].each do |section|
      progress += 20 if section
    end
    return progress
  end

  def pie_graph_data
    return {transportation: self.transportation_emissions, home_energy: self.home_energy_emissions, water: self.water_emissions, waste: self.waste_emissions, diet: self.diet_emissions}
  end
end
