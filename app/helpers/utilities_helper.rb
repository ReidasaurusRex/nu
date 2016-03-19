module UtilitiesHelper
  def measurement_options(utility)
    case utility.name
    when "natural_gas"
      return [['therms', 'therms'], ['hundred cubic feet', '100cft'], ['$', 'dollars']]
    when "fuel_oil"
      return [['gallons', 'gallons'], ['$', 'dollars']]
    when "propane"
      return [['gallons', 'gallons'], ['$', 'dollars']]
    when "electricity"
      return ['kWh', 'kWh']
    end
  end
end
