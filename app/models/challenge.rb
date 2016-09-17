class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :completed_challenges

  def image_path
    "icon_color_{self.progress_category}"
  end
end
