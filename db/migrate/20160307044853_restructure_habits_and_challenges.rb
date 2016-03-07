class RestructureHabitsAndChallenges < ActiveRecord::Migration
  def change
    drop_table :started_challenges
    drop_table :started_habits

    rename_table :completed_challenges, :profile_challenges
    rename_table :completed_habits, :profile_habits

    add_column :profile_challenges, :completed, :boolean
    add_column :profile_habits, :completed, :boolean
  end
end
