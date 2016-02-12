class CreatePendingFollows < ActiveRecord::Migration
  def change
    create_table :pending_follows do |t|
      t.integer :user_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
