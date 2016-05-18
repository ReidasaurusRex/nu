class DropProfileChallenges < ActiveRecord::Migration
  def change
    drop_table :profile_challenges
  end
end
