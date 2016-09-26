class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :completed_challenges

  fuzzily_searchable :progress_category, :title

  def image_path
    "icon_color_#{self.progress_category}.png"
  end

  def time_between_updates
    return self.length / (self.update_num - 1)
  end
end
