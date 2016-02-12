class ChangePendingFollowAndPendingSubscriptionIdNames < ActiveRecord::Migration
  def change
    rename_column :pending_subscriptions, :following_id, :pending_following_id
    rename_column :pending_follows, :follower_id, :pending_follower_id
  end
end
