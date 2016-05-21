class StartedChallengeUpdate < ActiveRecord::Base
  belongs_to :profile_started_challenge
  belongs_to :challenge

  after_create :add_points_for_updating_challenge

  def add_points_for_updating_challenge
    _self = self
    self.profile_started_challenge.profile.point_overview.add_points(1, _self.challenge.progress_category)
  end
end
