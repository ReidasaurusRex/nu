class ProfileCompletedChallenge < ActiveRecord::Base
  belongs_to :profile
  belongs_to :challenge

  after_create :add_points_for_completing_challenge

  def add_points_for_completing_challenge
    self.profile.point_overview.add_points(self.challenge.points, self.challenge.progress_category)
  end

  def completion_date
    self.created_at.strftime("%B %d, %Y")
  end

  def image_path
    "icon_color_#{self.progress_category}.png"
  end
end
