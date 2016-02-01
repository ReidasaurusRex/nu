class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :profile_id
      t.integer :source_id
      t.boolean :unseen
      t.string :type

      t.timestamps null: false
    end
  end
end
