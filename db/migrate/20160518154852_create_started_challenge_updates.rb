class CreateStartedChallengeUpdates < ActiveRecord::Migration
  def change
    create_table :started_challenge_updates do |t|
      t.integer :started_challenge_id
      t.integer :challenge_id
      t.integer :difficulty
      t.integer :update_number

      t.timestamps null: false
    end
  end
end
