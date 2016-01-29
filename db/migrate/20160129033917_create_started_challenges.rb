class CreateStartedChallenges < ActiveRecord::Migration
  def change
    create_table :started_challenges do |t|
      t.integer :profile_id
      t.integer :challenge_id
      t.integer :progress_category_id

      t.timestamps null: false
    end
  end
end
