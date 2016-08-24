class RemoveHeaderFromNewsfeedItems < ActiveRecord::Migration
  def change
    remove_column :newsfeed_items, :header
  end
end
