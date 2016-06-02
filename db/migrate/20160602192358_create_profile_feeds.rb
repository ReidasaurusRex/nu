class CreateProfileFeeds < ActiveRecord::Migration
  def change
    create_table :profile_feeds do |t|
      t.integer :profile_id
      t.integer :feed_id

      t.timestamps null: false
    end
  end
end
