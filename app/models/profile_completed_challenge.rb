class ProfileCompletedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  after_create :add_points_for_completing_challenge

  def add_points_for_completing_challenge
    self.profile.point_overview.add_points(self.challenge.points, self.challenge.progress_category)
  end
end
