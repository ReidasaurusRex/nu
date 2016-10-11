class Utility < ActiveRecord::Base
  belongs_to :home_energy

  validates :known, inclusion: {in: [true, false], 
    message: "Please select yes or no"}, on: :update
  validates :input_amount, numericality: {message: "Please enter a number"}, if: :known
  validate :proper_utility_amount_types, if: :known

  def proper_utility_amount_types
    case name
    when "fuel_oil" || "propane"
      errors.add(:input_type, "Please select gallons or dollars") unless ["gallons", "dollars"].include?(input_type)
    when "electricity"
      errors.add(:input_type, "Please select kWh") unless input_type == "kWh"
    when "natural_gas"
      errors.add(:input_type, "Please select therms, hundred cubic feet, or dollars") unless ["therms", "100cft", "dollars"].include?(input_type)
    end
  end

  @@state_conversion_list = [['ak', 1.09], ['al', 1.00], ['ar', 1.23], ['az', 1.06], ['ca', 0.57], ['co', 1.67], ['ct', 0.52], ['dc', 1.23], ['de', 1.26], ['fl', 1.14], ['ga', 1.08], ['hi', 1.47], ['ia', 1.40], ['id', 0.11], ['il', 1.00], ['in', 1.90], ['ks', 1.59], ['ky', 2.07], ['la', 1.15], ['ma', 0.90], ['md', 1.18], ['me', 0.56], ['mi', 1.32], ['mn', 1.16], ['mo', 1.72], ['ms', 0.98], ['mt', 1.29], ['nc', 1.06], ['ne', 1.64], ['nh', 0.51], ['nj', 0.52], ['nm', 1.76], ['nv', 0.92], ['ny', 0.56], ['oh', 1.62], ['ok', 1.37], ['or', 0.26], ['pa', 1.06], ['ri', 0.91], ['sc', 0.77], ['sd', 0.56], ['tn', 1.10], ['tx', 1.20], ['ut', 1.80], ['va', 0.82], ['vt', 0.00], ['wa', 0.13], ['wi', 1.36], ['wv', 1.97], ['wy', 2.10]]

  def state_conversion_factor
    state = self.home_energy.footprint.profile.state
    state_with_conversion = @@state_conversion_list.select{|ary| ary[0] == state}[0]
    return state_with_conversion[1]
  end

  def calculate_emissions
    case self.name
    when 'natural_gas'
      if self.known
        return (self.input_amount * 11.7).round if self.input_type == 'therms'
        return (self.input_amount * 12.03).round if self.input_type == '100cft'
        return (self.input_amount * 10.93).round if self.input_type == 'dollars'
      else
        return 256
      end
    when 'fuel_oil'
      if self.known
        return (self.input_amount * 22.61).round if self.input_type == 'gallons'
        return (self.input_amount * 6.31).round if self.input_type == 'dollars'
      else
        return 405
      end
    when 'propane'
      if self.known
        return (self.input_amount * 12.43).round if self.input_type == 'gallons'
        return (self.input_amount * 4.38).round if self.input_type == 'dollars'
      else
        return 187
      end
    when 'electricity'
      if self.known
        return (self.input_amount * self.state_conversion_factor).round
      else
        return 455
      end
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

  def percent_of_home_energy
    if self.sub_section_emissions && self.home_energy.section_emissions
      percentage = ((self.sub_section_emissions.to_f / self.home_energy.section_emissions.to_f) * 100).round
      return "#{percentage}% of home energy emissions"
    else
      return "Pending"
    end
  end
end
