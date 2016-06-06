class DropProfileIdFromNewsfeedItem < ActiveRecord::Migration
  def change
    remove_column :newsfeed_items, :profile_id
  end
end
