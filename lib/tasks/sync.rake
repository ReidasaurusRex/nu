namespace :sync do
  desc 'Update RSS content and post to followers'
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        if feed.entries.where(title: entry.title).first
          local_entry = feed.entries.where(title: entry.title).first
          local_entry.update_attributes(summary: entry.summary, author: entry.author, url: entry.url, published: entry.published)
        else
          new_entry = feed.entries.create(title: entry.title, summary: entry.summary, author: entry.author, url: entry.url, published: entry.published)
          create_newsfeed_rss_feed_entry(new_entry, feed)
        end
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.title}"
    end
  end
end

def create_newsfeed_rss_feed_entry(entry, feed)
  newsfeed_item = NewsfeedItem.create(source_type: "feed", source_id: feed.id, header: "<a href='#{entry.url}' target='_blank' >#{entry.title}</a>", content: entry.summary)
  post_to_feed_followers(newsfeed_item, feed)
end

def post_to_feed_followers(newsfeed_item, feed)
  feed.profiles.each do |profile|
    NewsfeedItemProfile.create(newsfeed_item_id: newsfeed_item.id, profile_id: profile.id)
  end
end