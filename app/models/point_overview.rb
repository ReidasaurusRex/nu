class PointOverview < ActiveRecord::Base
  belongs_to :profile

  def add_points(points, category)
    new_total = (self.total + points)
    new_category = (self[category.to_sym] +  points)
    self.update(total: new_total, category.to_sym => new_category)
  end

  def add_score_from_footprint
    self.update(total: self.total + 10, diet: self.diet + 2, waste: self.waste + 2, water: self.water + 2, transportation: self.transportation + 2, home_energy: self.home_energy + 2)  
  end

  def section_percent(section)
    return ((self[section].to_f / self.total) * 100).round unless self[section] == 0
    return 0
  end

  def graph_data
    return {diet: self.diet, water: self.water, waste: self.waste, transportation: self.transportation, home_energy: self.home_energy, social: self.social}
  end
end
