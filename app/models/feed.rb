class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_many :profile_feeds, dependent: :destroy
  has_many :profiles, through: :profile_feeds

  def self.create_from_feedjira_feed(parsed_feed)
    feed = Feed.new(name: parsed_feed.title, url: parsed_feed.url, description: parsed_feed.description, suggested: false)
    if feed.save
      return feed
    else
      raise "Couldn\'t create feed"
    end
  end
end
