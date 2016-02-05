class TransportationProfile < ActiveRecord::Base
  belongs_to :emissions_profile
  has_one :vehicle_profile, dependent: :destroy
  has_one :public_transportation_profile, dependent: :destroy
  has_one :air_profile, dependent: :destroy
end
