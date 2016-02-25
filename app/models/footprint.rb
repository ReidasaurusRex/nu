class Footprint < ActiveRecord::Base
  belongs_to :profile 
  has_one :water_profile, dependent: :destroy
  has_one :diet_profile, dependent: :destroy
  has_one :waste_profile, dependent: :destroy
  has_one :transportation_profile, dependent: :destroy
  has_one :home_energy_profile, dependent: :destroy

  def check_for_completion
    if self.total_emissions &&  self.water_emissions && self.diet_emissions && self.transportation_emissions && self.waste_emissions && self.home_energy_emissions
      self.completed = true
    end
  end
end
