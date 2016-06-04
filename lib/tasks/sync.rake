namespace :sync do
  desc 'Update RSS content'
  task feeds: [:environment] do
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(summary: entry.summary, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.title}"
    end
  end
end