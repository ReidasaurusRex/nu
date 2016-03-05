class PublicTransportation < ActiveRecord::Base
  belongs_to :transportation

  @@public_transportation_types = [:metro, :commuter, :inter_city, :bus, :taxi]
  validates :use, inclusion: {in: [true, false],
    message: "Please select yes or no"}
  @@public_transportation_types.each do |pub_trans|
    validates pub_trans, numericality: {message: "Please enter a number"}, if: :use
  end

  def calculate_emissions
    # Sections are in miles per month
    emissions = 0
    if self.use
      emissions += (self.metro * 0.382) if self.metro
      emissions += (self.commuter * 0.452) if self.commuter
      emissions += (self.inter_city * 0.353) if self.inter_city
      emissions += (self.bus * 0.643) if self.bus
      emissions += (self.taxi * 2.25) if self.taxi
    end
    return emissions.to_i
  end
end
