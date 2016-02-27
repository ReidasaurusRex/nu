class WaterProfile < ActiveRecord::Base
  belongs_to :footprint

  validates :use, inclusion: {in: ["1", "0"], 
    message: "Please select yes or no"}
  validates :known, inclusion: {in: ["1", "0"], 
    message: "Please select yes or no"}, if: :use
  validates :measurement_amount, numericality: {greater_than_or_equal_to: 0, 
    message: "Please enter a positive number"}, if: :known
  validates :measurement_type, inclusion: {in: ['gallons, 100cf'], 
    message: "Please select gallons or 100 cubic feet"}, if: :known

  def state_conversion_factor
    
  end

  def calculate_emissions
    if self.use
      if self.known
        if self.measurement_type == 'gallons'
          amount = self.measurement_amount
        else
          amount = self.measurement_amount * 748
        end
        return (amount * 0.045 * self.state_conversion_factor)
      else
        return 15.61
      end
    else
      return 0
    end
  end
end
