class CreateNewsfeedItems < ActiveRecord::Migration
  def change
    create_table :newsfeed_items do |t|
      t.integer :profile_id
      t.integer :source_id
      t.string :type
      t.string :header
      t.string :content

      t.timestamps null: false
    end
  end
end
