class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.integer :profile_id
      t.boolean :likes
      t.boolean :comments
      t.boolean :challenge_reminders
      t.boolean :new_challenges

      t.timestamps null: false
    end
  end
end
