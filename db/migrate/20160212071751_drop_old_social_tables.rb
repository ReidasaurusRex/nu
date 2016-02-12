class DropOldSocialTables < ActiveRecord::Migration
  def change
    drop_table :followers
    drop_table :followings
    drop_table :pending_followers
    drop_table :pending_followings
  end
end
