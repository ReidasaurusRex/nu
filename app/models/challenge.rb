class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :completed_challenges

  fuzzily_searchable :progress_category, :title

  def image_path
    "icon_color_#{self.progress_category}.png"
  end
end
