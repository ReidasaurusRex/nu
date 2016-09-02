class CreateProfileBlockedProfiles < ActiveRecord::Migration
  def change
    create_table :profile_blocked_profiles do |t|
      t.integer :profile_id
      t.integer :blocked_profile_id

      t.timestamps null: false
    end
  end
end
