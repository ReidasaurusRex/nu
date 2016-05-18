class ChangeChallengePointsToInteger < ActiveRecord::Migration
  def change
    remove_column :challenges, :points
    add_column :challenges, :points, :integer
  end
end
