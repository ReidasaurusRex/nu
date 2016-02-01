class CreateBetaUsers < ActiveRecord::Migration
  def change
    create_table :beta_users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
