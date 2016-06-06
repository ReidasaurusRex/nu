class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :newsfeed_item_id
      t.string :profile_id

      t.timestamps null: false
    end
  end
end
