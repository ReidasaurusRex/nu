class Vehicle < ActiveRecord::Base
  belongs_to :transportation

  @@vehicle_types = ['car', 'truck', 'motorcycle']
  @@fuel_types = ['gasoline', 'diesel', 'b100', 'b20', 'hybrid', 'pi_hybrid', 'electric']

  validates :have, inclusion: {in: [true, false], 
    message: "Please select true or false"}
  validates :vehicle_type, inclusion: {in: @@vehicle_types, 
    message: "Please select a vehicle type"}, if: :have
  validates :fuel_type, inclusion: {in: @@fuel_types,
    message: "Please select a fuel type"}, if: :have
  validates :mweek, numericality: {message: "Please enter a number"}, if: :have
  validates :mpg, numericality: {message: "Please enter a number"}, if: :have

  def calculate_emissions
    if self.have
      ie = 0.163 * self.mweek * 4
      unless has_electricity?(self.fuel_type)
        gmonth = (self.mweek / self.mpg)
        return (ie + (gmonth * fuel_conversion(self.fuel_type))).round
      else
        return (ie + (self.mweek * fuel_conversion(self.fuel_type))).round
      end
    else
      return 0
    end
  end

  def has_electricity?(fuel_type)
    if fuel_type == 'hybrid' || fuel_type == 'pi_hybrid' || fuel_type == 'electric'
      return true
    else
      return false
    end
  end

  def fuel_conversion(fuel_type)
    case fuel_type
    when 'gasoline'
      return 19.8
    when 'diesel'
      return 22.66
    when 'b100'
      return 20.98
    when 'b20'
      return 22.28
    when 'hybrid'
      return 0.51
    when 'pi_hybrid'
      return 0.61
    when 'electric'
      return 0.54
    end
  end

  def percent_of_transportation
    if self.sub_section_emissions && self.transportation.section_emissions
      unless self.transportation.section_emissions == 0
        percentage = ((self.sub_section_emissions.to_f / self.transportation.section_emissions.to_f) * 100).round
      else
        percentage = 0
      end
      return "#{percentage}\% of transportation emissions"
    else
      return "Pending"
    end
  end
  
end
