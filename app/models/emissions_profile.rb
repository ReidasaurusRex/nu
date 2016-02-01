class EmissionsProfile < ActiveRecord::Base
  belongs_to :profile 
  has_one :water_profile
  has_one :diet_profile
  has_one :waste_profile
  has_one :transportation_profile
  has_one :home_energy_profile
end
