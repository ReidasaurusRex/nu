class ChangeTypeToSourceTypeInNewsfeedItems < ActiveRecord::Migration
  def change
    rename_column :newsfeed_items, :type, :source_type
  end
end
