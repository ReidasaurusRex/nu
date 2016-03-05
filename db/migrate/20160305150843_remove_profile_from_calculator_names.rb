class RemoveProfileFromCalculatorNames < ActiveRecord::Migration
  def change
    rename_column :air_travel_profiles, :transportation_profile_id, :transportation_id
    rename_table :air_travel_profiles, :air_travels

    rename_column :public_transportation_profiles, :transportation_profile_id, :transportation_id
    rename_table :public_transportation_profiles, :public_transportations

    rename_column :vehicle_profiles, :transportation_profile_id, :transportation_id
    rename_table :vehicle_profiles, :vehicles

    rename_column :utility_profiles, :home_energy_profile_id, :home_energy_id
    rename_table :utility_profiles, :utilities

    rename_table :transportation_profiles, :transportations
    rename_table :home_energy_profiles, :home_energies
    rename_table :waste_profiles, :wastes
    rename_table :water_profiles, :waters
    rename_table :diet_profiles, :diets
  end
end
