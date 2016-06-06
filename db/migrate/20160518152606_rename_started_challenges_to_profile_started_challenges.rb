class RenameStartedChallengesToProfileStartedChallenges < ActiveRecord::Migration
  def change
    rename_table :started_challenges, :profile_started_challenges
  end
end
