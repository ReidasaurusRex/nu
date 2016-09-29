class AddUpdateNumberToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :update_num, :integer
  end
end
