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

  def post_if_first_completion(prior_complete)
    if !prior_complete && self.complete?
      profile = self.profile
      profile.newsfeed_items.create(source_id: profile.id, header: "Completed an emissions assessment", content: "#{profile.first_name.capitalize} checked out their carbon footprint, and it's at #{self.total_emissions}lbs of CO2e!")
      profile.post_to_followers("Completed an emissions assessment", "#{profile.first_name.capitalize} checked out their carbon footprint, and it's at #{self.total_emissions}lbs of CO2e!")
    end
  end
end
