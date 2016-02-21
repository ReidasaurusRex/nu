class AddCommunicateToBetaUsers < ActiveRecord::Migration
  def change
    add_column :beta_users, :communicate, :integer
  end
end
