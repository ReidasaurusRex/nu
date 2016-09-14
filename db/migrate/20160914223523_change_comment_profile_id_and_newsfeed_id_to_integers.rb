class ChangeCommentProfileIdAndNewsfeedIdToIntegers < ActiveRecord::Migration
  def change
    change_column :comments, :profile_id, 'integer USING CAST(profile_id AS integer)'
    change_column :comments, :newsfeed_item_id, 'integer USING CAST(newsfeed_item_id AS integer)'
  end
end
