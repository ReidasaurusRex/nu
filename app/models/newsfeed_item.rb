class NewsfeedItem < ActiveRecord::Base
  has_many :newsfeed_item_profiles, dependent: :destroy
  has_many :profiles, through: :newsfeed_item_profiles
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :tags, as: :taggable

  validates :content, presence: {message: "Please add some content"}

  def self.find_by_tag_name(query, limit)
    Tag.where(taggable_type: "NewsfeedItem").find_by_fuzzy_name(query, limit: limit).map{|tag| self.find(tag.taggable_id)}
  end
  
  def source
    if self.source_type == "profile"
      return Profile.find(self.source_id)
    elsif self.source_type == "feed"
      return Entry.find(self.source_id)
    else
      raise "Invalid source type"
    end
  end

  def time_since_creation
    time_array = [[3153600 ,"yr"], [2592000, "mth"], [86400, "d"], [3600, "hr"], [60, "m"], [1, "s"]]
    time_since = Time.now - self.updated_at
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

  def source_name_or_title(profile)
    if self.source_type == "feed"
      return source.title
    else
      return self.source_name_or_you(profile)
    end
  end

  def source_name_or_you(profile)
    if self.source == profile
      return "You"
    else
      return self.source.full_or_abbrev_name
    end
  end

  def belongs_to_profile?(profile)
    return self.source == profile
  end

  def add_tags(tags)
    self.tags.each{|tag| tag.destroy}
    _self = self
    unless tags.empty?
      tags.each do |name, val| 
        _self.tags.create(name: name)
      end
    end
  end
end
