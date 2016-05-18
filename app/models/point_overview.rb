class PointOverview < ActiveRecord::Base
  belongs_to :profile

  def add_points(points, category)
    new_total = (self.total + points)
    new_category = (self[category.to_sym] +  points)
    self.update(total: new_total, category.to_sym => new_category)
  end
end
