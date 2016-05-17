class CreatePointOverviews < ActiveRecord::Migration
  def change
    create_table :point_overviews do |t|
      t.integer :profile_id
      t.integer :total
      t.integer :diet
      t.integer :waste
      t.integer :water
      t.integer :transportation
      t.integer :home_energy

      t.timestamps null: false
    end
  end
end
