class Transportation < ActiveRecord::Base
  belongs_to :footprint
  has_one :vehicle, dependent: :destroy
  has_one :public_transportation, dependent: :destroy
  has_one :air_travel, dependent: :destroy

  def complete?
    if self.vehicle_emissions && self.public_emissions && self.air_emissions
      return true
    else
      return false
    end
  end

  def update_emissions
    if self.complete?
      emissions = 0
      [self.public_emissions, self.air_emissions, self.vehicle_emissions].each do |subsection|
        if subsection.is_a? Integer
          emissions += subsection
        end
      end
      self.update(section_emissions: emissions)
      prior_footprint_completion = self.footprint.complete?
      self.footprint.update(transportation_emissions: emissions)
      self.footprint.update_total_if_complete
      self.footprint.post_and_score_if_first_completion(prior_footprint_completion)
    end
  end

  def emissions_overview
    if self.section_emissions
      return "#{self.section_emissions}lbs CO2e"
    else
      return "Pending"
    end
  end

  def image_path
    if self.section_emissions
      return "progress_icons/color/transportation"
    else
      return "progress_icons/grayscale/transportation"
    end
  end
end
