class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :completed_challenges

  def image_path
    "progress_icons/color/#{self.progress_category}"
  end
end
