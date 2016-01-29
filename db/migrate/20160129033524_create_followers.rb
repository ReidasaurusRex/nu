class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :profile_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
