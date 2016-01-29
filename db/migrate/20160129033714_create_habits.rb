class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :title
      t.string :caption
      t.string :description
      t.integer :points
      t.integer :carbon_offset
      t.integer :effot
      t.integer :longevity_number
      t.integer :longevity_period
      t.integer :progress_category_id

      t.timestamps null: false
    end
  end
end
