class CreateEmissionProfiles < ActiveRecord::Migration
  def change
    create_table :emission_profiles do |t|
      t.integer :profile_id
      t.boolean :completed
      t.integer :total_emissions
      t.integer :water_emissions
      t.integer :diet_emissions
      t.integer :transportation_emissions
      t.integer :waste_emissions
      t.integer :home_energy_emissions

      t.timestamps null: false
    end
  end
end
