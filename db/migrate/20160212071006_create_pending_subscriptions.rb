class CreatePendingSubscriptions < ActiveRecord::Migration
  def change
    create_table :pending_subscriptions do |t|
      t.integer :user_id
      t.integer :following_id

      t.timestamps null: false
    end
  end
end
