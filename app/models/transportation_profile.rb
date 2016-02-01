class TransportationProfile < ActiveRecord::Base
  belongs_to :emissions_profile
  has_one :vehicle_profile
  has_one :public_transportation_profile
  has_one :air_profile
end
