class Utility < ActiveRecord::Base
  belongs_to :home_energy

  validates :input_amount, numericality: {message: "Please enter a number"}, if: :known
  validate :proper_utility_amount_types, if: :known

  def proper_utility_amount_types
    case name
    when "fuel_oil" || "propane"
      errors.add(:input_type, "Please select gallons or dollars") unless ["gallons", "dollars"].include?(input_type)
    when "electricity"
      errors.add(:input_type, "Please select kWh") unless input_type == "kWh"
    when "natural_gas"
      errors.add(:input_type, "Please select therms, hundred cubic feet, or dollars") unless ["therms, 100cft, dollars"].include?(input_type)
    end
  end

  def smart_name
    case self.name
    when "fuel_oil"
      return "fuel oil"
    when "electricity"
      return "electricity"
    when "propane"
      return "propane"
    when "natural_gas"
      return "natural gas"
    end
  end
end
