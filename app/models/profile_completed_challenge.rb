class ProfileCompletedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  after_create :add_points_from_completed_challenge

  def add_points_from_completed_challenge
    self.profile.point_overview.add_from_challenge_completion(self.challenge)
  end
end
