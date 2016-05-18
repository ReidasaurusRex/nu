class PointOverview < ActiveRecord::Base
  belongs_to :profile

  def add_from_challenge_completion(challenge)
    new_total = (self.total + challenge.points)
    new_category = (self[challenge.progress_category.to_sym] +  challenge.points)
    self.update(total: new_total, challenge.progress_category.to_sym => new_category)
  end
end
