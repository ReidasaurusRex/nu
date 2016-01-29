class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :profile_id
      t.integer :following_id

      t.timestamps null: false
    end
  end
end
