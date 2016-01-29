class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :caption
      t.string :description
      t.string :points
      t.integer :progress_category_id

      t.timestamps null: false
    end
  end
end
