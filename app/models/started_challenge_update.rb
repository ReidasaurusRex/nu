class StartedChallengeUpdate < ActiveRecord::Base
  belongs_to :profile_started_challenge
  belongs_to :challenge

  after_create :add_points_for_updating_challenge

  def add_points_for_updating_challenge
    self.profile.point_overview.add_points(1, self.challenge.progress_category)
  end
end
