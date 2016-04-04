module StatsHelper
  def emissions_statement(footprint, index)
    if footprint.complete? 
      return "#{footprint.total_emissions}lbs CO2e"
    elsif index == 0
      return "Pending"
    else
      return "Incomplete"
    end
  end
end
