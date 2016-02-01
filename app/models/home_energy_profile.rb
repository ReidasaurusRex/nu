class HomeEnergyProfile < ActiveRecord::Base
  belongs_to :emissions_profile
  has_many :utility_profiles
end
