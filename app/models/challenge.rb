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

  def reccommended_time_message
  time_array = [[3153600 ,"yr"], [2592000, "mth"], [86400, "d"], [3600, "hr"], [60, "m"], [1, "s"]]
    time_array.each do |time| 
      if (self.time_between_updates / time[0]) >= 1
        x_since = (self.time_between_updates / time[0]).to_i
        response = "#{x_since}#{time[1]}"
        return response
      end
    end
  end
end
