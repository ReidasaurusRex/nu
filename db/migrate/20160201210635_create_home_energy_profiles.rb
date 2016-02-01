class CreateHomeEnergyProfiles < ActiveRecord::Migration
  def change
    create_table :home_energy_profiles do |t|
      t.integer :emissions_profile_id
      t.boolean :completed
      t.integer :fuel_oil_emissions
      t.integer :propane_emissions
      t.integer :natural_gas_emissions
      t.integer :electricity_emissions
      t.integer :section_emissions

      t.timestamps null: false
    end
  end
end
