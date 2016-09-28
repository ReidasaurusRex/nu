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
    return self.created_at.strftime("%B %d, %Y")
  end

  def image_path
    return "icon_color_#{self.progress_category}.png"
  end

  def updateable?
    if self.started_challenge_updates.length > 0
      return (Time.now - self.started_challenge_updates.last.created_at) > self.challenge.time_between_updates
    else
      return (Time.now - self.created_at) > self.challenge.time_between_updates
    end
  end

  def time_til_updateable
    time_since = self.started_challenge_updates.last ? (Time.now - self.started_challenge_updates.last.created_at) : (Time.now - self.created_at)
    return self.challenge.time_between_updates - time_since
  end

  def date_updateable
    return  Time.at(Time.now.to_f + self.time_til_updateable)
  end

  def update_message
    date = self.date_updateable
    time_til = date - Time.now
    if time_til > 86400
      return "Update on #{date.strftime("%b %d")}"
    else
      return "Update in #{(time_til / 3600).ceil}hr"
    end
  end
end
