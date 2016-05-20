class ProfileStartedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  has_many :started_challenge_updates


  after_create :add_points_for_starting_challenge

  def add_points_for_starting_challenge
    self.profile.point_overview.add_points(2, self.challenge.progress_category)
  end
end
