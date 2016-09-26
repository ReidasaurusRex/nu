class ProfileStartedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  has_many :started_challenge_updates


  after_create :add_points_for_starting_challenge

  def add_points_for_starting_challenge
    self.profile.point_overview.add_points(2, self.challenge.progress_category)
  end

  def average_difficulty
    total_difficulty = self.started_challenge_updates.pluck(:difficulty).reduce(:+)
    return (total_difficulty.to_f / self.started_challenge_updates.length).round(1)
  end

  def start_date
    self.created_at.strftime("%B %d, %Y")
  end

  def image_path
    "icon_color_#{self.progress_category}.png"
  end

  def updateable?
    if self.started_challenge_updates.length > 0
      return (Time.now - self.started_challenge_updates.last.created_at) > self.challenge.time_between_updates
    else
      return (Time.now - self.created_at) > self.challenge.time_between_updates
    end
  end
end
