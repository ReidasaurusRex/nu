class CreatePendingFollowers < ActiveRecord::Migration
  def change
    create_table :pending_followers do |t|
      t.integer :profile_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
