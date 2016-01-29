class CreateBlockedUsers < ActiveRecord::Migration
  def change
    create_table :blocked_users do |t|
      t.integer :profile_id
      t.integer :blocked_id

      t.timestamps null: false
    end
  end
end
