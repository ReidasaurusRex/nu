class VehicleProfile < ActiveRecord::Base
  belongs_to :transportation_profile

  @@vehicle_types = ['car', 'truck', 'motorcycle']
  @@fuel_types = ['gasoline', 'diesel', 'b100', 'b20', 'hybrid', 'pi_hybrid', 'electric']

  validates :have, inclusion: {in: [true, false], 
    message: "Please select true or false"}
  validates :vehicle_type, inclusion: {in: @@vehicle_types, 
    message: "Please select a vehicle type"}, if: :have
  validates :fuel_type, inclusion: {in: @@fuel_types,
    message: "Please select a fuel type"}, if: :have
  validates :mmonth, numericality: {message: "Please enter a number"}, if: :have
  validates :mpg, numericality: {message: "Please enter a number"}, if: :have

  def calculate_emissions
    if self.have
      ie = 0.163 * self.mmonth
      unless has_electricity?(self.fuel_type)
        gmonth = (self.mmonth / self.mpg)
        return ie + (gmonth * fuel_conversion(self.fuel_type))
      else
        return ie + (self.mmonth * fuel_conversion(self.fuel_type))
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
  
end
