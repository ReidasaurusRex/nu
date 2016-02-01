class CreateTransportationProfiles < ActiveRecord::Migration
  def change
    create_table :transportation_profiles do |t|
      t.integer :emissions_profile_id
      t.boolean :completed
      t.integer :vehicle_emissions
      t.integer :public_emissions
      t.integer :air_emissions
      t.integer :section_emissions

      t.timestamps null: false
    end
  end
end
