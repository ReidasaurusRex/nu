class RenameStartedChallengeIdtoProifleStartedChallengeIdInStartedChallengeUpdates < ActiveRecord::Migration
  def change
    rename_column :started_challenge_updates, :started_challenge_id, :profile_started_challenge_id
  end
end
