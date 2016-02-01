class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :profile_id
      t.string :type
      t.string :header
      t.string :content

      t.timestamps null: false
    end
  end
end
