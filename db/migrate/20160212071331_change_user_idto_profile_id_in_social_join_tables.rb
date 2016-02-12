class ChangeUserIdtoProfileIdInSocialJoinTables < ActiveRecord::Migration
  def change
    rename_column :follows, :user_id, :profile_id
    rename_column :pending_follows, :user_id, :profile_id
    rename_column :subscriptions, :user_id, :profile_id
    rename_column :pending_subscriptions, :user_id, :profile_id
  end
end
