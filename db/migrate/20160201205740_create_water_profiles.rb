class CreateWaterProfiles < ActiveRecord::Migration
  def change
    create_table :water_profiles do |t|
      t.integer :emission_profile_id
      t.boolean :use
      t.boolean :known
      t.string :measurement_type
      t.real :measurement_amount
      t.integer :section_emissions

      t.timestamps null: false
    end
  end
end
