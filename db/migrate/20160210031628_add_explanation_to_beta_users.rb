class AddExplanationToBetaUsers < ActiveRecord::Migration
  def change
    add_column :beta_users, :explanation, :string
  end
end
