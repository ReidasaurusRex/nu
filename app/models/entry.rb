class Entry < ActiveRecord::Base
  belongs_to :feed
  def time_since_publish
    time_array = [[3153600 ,"yr"], [2592000, "mth"], [86400, "d"], [3600, "hr"], [60, "m"], [1, "s"]]
    time_since = Time.now - self.published
    time_array.each do |time| 
      unless time[0] == 1
        if (time_since / time[0]) >= 1
          x_since = (time_since / time[0]).to_i
          response = "#{x_since}#{time[1]}"
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

  def newsfeed_item
    return NewsfeedItem.where("source_id = ? AND source_type = ?", self.id, "feed")[0]
  end
end
