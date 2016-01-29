class CreatePrivacySettings < ActiveRecord::Migration
  def change
    create_table :privacy_settings do |t|
      t.integer :user_id
      t.string :display_location
      t.string :display_stats
      t.string :display_feed

      t.timestamps null: false
    end
  end
end
