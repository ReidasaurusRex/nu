class ChangeIntegerToFloatInAverageDifficultyIdInProfileCompletedChallenges < ActiveRecord::Migration
  def change
    change_column :profile_completed_challenges, :average_difficulty, :float
  end
end
