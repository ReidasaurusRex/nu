class Water < ActiveRecord::Base
  belongs_to :footprint

  validates :use, inclusion: {in: [true, false], 
    message: "Please select yes or no"}
  validates :known, inclusion: {in: [true, false], 
    message: "Please select yes or no"}, if: :use
  validates :measurement_amount, numericality: {greater_than_or_equal_to: 0, 
    message: "Please enter a positive number"}, if: [:use, :known]
  validates :measurement_type, inclusion: {in: ["gallons", "100cf"], 
    message: "Please select gallons or 100 cubic feet"}, if: [:use, :known]

  @@state_conversion_list = [['ak', 1.09], ['al', 1.00], ['ar', 1.23], ['az', 1.06], ['ca', 0.57], ['co', 1.67], ['ct', 0.52], ['dc', 1.23], ['de', 1.26], ['fl', 1.14], ['ga', 1.08], ['hi', 1.47], ['ia', 1.40], ['id', 0.11], ['il', 1.00], ['in', 1.90], ['ks', 1.59], ['ky', 2.07], ['la', 1.15], ['ma', 0.90], ['md', 1.18], ['me', 0.56], ['mi', 1.32], ['mn', 1.16], ['mo', 1.72], ['ms', 0.98], ['mt', 1.29], ['nc', 1.06], ['ne', 1.64], ['nh', 0.51], ['nj', 0.52], ['nm', 1.76], ['nv', 0.92], ['ny', 0.56], ['oh', 1.62], ['ok', 1.37], ['or', 0.26], ['pa', 1.06], ['ri', 0.91], ['sc', 0.77], ['sd', 0.56], ['tn', 1.10], ['tx', 1.20], ['ut', 1.80], ['va', 0.82], ['vt', 0.00], ['wa', 0.13], ['wi', 1.36], ['wv', 1.97], ['wy', 2.10]]
  
  def state_conversion_factor
    state = self.footprint.profile.state
    state_with_conversion = @@state_conversion_list.select{|ary| ary[0] == state}[0]
    return state_with_conversion[1]
  end

  def calculate_emissions
    if self.use
      if self.known
        if self.measurement_type == 'gallons'
          amount = self.measurement_amount
        else
          amount = self.measurement_amount * 748
        end
        return (amount * 0.045 * self.state_conversion_factor).to_i
      else
        return 16
      end
    else
      return 0
    end
  end

  def emissions_overview
    if self.section_emissions
      return "#{self.section_emissions}lbs CO2e"
    else
      return "Pending"
    end
  end

  def usage_overview
    if self.use
      if self.known
        return "#{self.measurement_amount} #{self.measurement_type}"
      else
        return "Average"
      end
    else
      return "None"
    end
  end
end
