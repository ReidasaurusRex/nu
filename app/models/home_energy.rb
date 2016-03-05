class HomeEnergyProfile < ActiveRecord::Base
  belongs_to :footprint
  has_many :utility_profiles, dependent: :destroy
end
