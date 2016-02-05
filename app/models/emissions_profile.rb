class EmissionsProfile < ActiveRecord::Base
  belongs_to :profile 
  has_one :water_profile, dependent: :destroy
  has_one :diet_profile, dependent: :destroy
  has_one :waste_profile, dependent: :destroy
  has_one :transportation_profile, dependent: :destroy
  has_one :home_energy_profile, dependent: :destroy
end
