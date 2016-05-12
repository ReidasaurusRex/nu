class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :newsfeed_item_id
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
