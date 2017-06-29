namespace :clean do 
  desc 'Destroy old and inactive RSS entries and related database entries'
  task entries: [:environment] do 
    Entry.all.each do |entry| 
      if (Time.now - entry.created_at) > 1604000 # roughly two weeks
        p "Destroying #{entry.title}..."
        entry.newsfeed_item.destroy 
        entry.destroy
        p "Destroyed"
      end
    end
  end
end