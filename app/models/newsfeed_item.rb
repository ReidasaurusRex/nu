class NewsfeedItem < ActiveRecord::Base
  belongs_to :profile
  belongs_to :source, class_name: "Profile"

  def time_since_creation
    time_array = [[3153600 ,"year"], [2592000, "month"], [86400, "day"], [3600, "hour"], [60, "min"], [1, "sec"]]
    time_since = Time.now - self.created_at
    time_array.each do |time| 
      unless time[0] == 1
        if (time_since / time[0]) >= 1
          x_since = (time_since / time[0]).to_i
          response = "#{x_since} #{time[1]}"
          response << "s" if x_since > 1
          return response
        end
      else
        if (time_since / time[0]) >= 1
          response = "Seconds ago"
        else
          response = "Just now"
        end
        return response
      end
    end
  end
end
