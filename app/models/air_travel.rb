class AirTravel < ActiveRecord::Base
  belongs_to :transportation

  @@keys = [:d_economy, :d_business, :i_economy, :i_premium_economy, :i_business, :i_first, :transportation_id]
  @@keys.each do |key|
    validates key, numericality: {only_integer: true, 
      message: "Please enter an integer"}
  end

  def calculate_emissions
    # Sections are in numbers of flights in a given class
    emissions = 0
    emissions += (self.d_economy * 701) if self.d_economy
    emissions += (self.d_business * 1051) if self.d_business
    emissions += (self.i_economy * 1620) if self.i_economy
    emissions += (self.i_premium_economy * 2593) if self.i_premium_economy
    emissions += (self.i_business * 4699) if self.i_business
    emissions += (self.i_first * 6481) if self.i_first
    return emissions / 12
  end

  def percent_of_transportation
    if self.sub_section_emissions && self.transportation.section_emissions
      percentage = ((self.sub_section_emissions.to_f / self.transportation.section_emissions.to_f) * 100).to_i
      return "#{percentage}% of transportation emissions"
    else
      return "Pending"
    end
  end

end
