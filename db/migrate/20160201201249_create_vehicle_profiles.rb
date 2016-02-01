class CreateVehicleProfiles < ActiveRecord::Migration
  def change
    create_table :vehicle_profiles do |t|
      t.integer :transportation_profile_id
      t.boolean :have
      t.string :vehicle_type
      t.string :fuel_type
      t.integer :mmonth
      t.integer :mpg
      t.integer :sub_section_emissions

      t.timestamps null: false
    end
  end
end
