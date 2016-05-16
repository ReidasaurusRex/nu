class NewsfeedItem < ActiveRecord::Base
  has_many :newsfeed_item_profiles, dependent: :destroy
  has_many :profiles, through: :newsfeed_item_profiles
  has_many :comments, dependent: :destroy
  belongs_to :source, class_name: "Profile"
  has_many :likes

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

  def source_name_or_you(profile)
    if self.source == profile
      return "You"
    else
      return self.source.full_name
    end
  end

  def belongs_to_profile?(profile)
    return self.source == profile
  end
end
