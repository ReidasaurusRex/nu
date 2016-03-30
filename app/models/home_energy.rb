class HomeEnergy < ActiveRecord::Base
  belongs_to :footprint
  has_many :utilities, dependent: :destroy

  def finished?
    unless self.utilities.empty?
      return self.utilities.all?{|util| util.emissions}
    else
      return true
    end
  end

  def create_utilities(utils)
    self.utilities.each{|util| util.destroy}
    _self = self
    unless utils.empty?
      utils.each do |name, val|
        _self.utilities.create(name: name)
      end
    end
  end

  def emissions_overview
    if self.section_emissions
      return "#{self.section_emissions}lbs CO2e"
    else
      return "Pending"
    end
  end

  def update_emissions(emissions)
    self.update(section_emissions: emissions)
    self.footprint.update(home_energy_emissions: emissions)
    self.footprint.update_total_if_complete
    binding.pry
  end
end
