class DropStateFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :state
  end
end
