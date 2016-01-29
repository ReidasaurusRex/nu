class CreateCompletedChallenges < ActiveRecord::Migration
  def change
    create_table :completed_challenges do |t|
      t.integer :profile_id
      t.integer :challenge_id
      t.integer :progress_category_id
      t.string :completion_entry

      t.timestamps null: false
    end
  end
end
