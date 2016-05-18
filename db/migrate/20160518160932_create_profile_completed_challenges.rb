class CreateProfileCompletedChallenges < ActiveRecord::Migration
  def change
    create_table :profile_completed_challenges do |t|
      t.integer :profile_id
      t.integer :challenge_id
      t.string :entry
      t.integer :average_difficulty

      t.timestamps null: false
    end
  end
end
