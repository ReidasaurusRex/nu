class Transportation < ActiveRecord::Base
  belongs_to :footprint
  has_one :vehicle, dependent: :destroy
  has_one :public_transportation, dependent: :destroy
  has_one :air_travel, dependent: :destroy

  def check_for_completion
    if self.vehicle_emissions && self.public_emissions && self.air_emissions
      self.update(completed: true)
    end
  end

  def calculate_emissions
    emissions = 0
    [self.public_emissions, self.air_emissions, self.vehicle_emissions].each do |subsection|
      if subsection.is_a? Integer
        emissions += subsection
      end
    end
    self.update(section_emissions: emissions)
  end
end