class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  has_many :profile_feeds, dependent: :destroy
  has_many :profiles, through: :profile_feeds

  def self.create_from_feedjira_feed(url, parsed_feed)
    feed = Feed.new(title: parsed_feed.title, url: url, description: parsed_feed.description, suggested: false)
    if feed.save
      parsed_feed.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(published: entry.published, url: entry.url, author: entry.author, summary: entry.summary)
      end
      return feed
    else
      raise "Couldn\'t create feed"
    end
  end

  def self.suggested_feeds
    return self.where(suggested: true)
  end
end
