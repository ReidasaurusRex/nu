class ChangeEmissionsProfilesToFootprints < ActiveRecord::Migration
  def change
    rename_table :emissions_profiles, :footprints
    rename_column :water_profiles, :emissions_profile_id, :footprint_id
    rename_column :waste_profiles, :emissions_profile_id, :footprint_id
    rename_column :diet_profiles, :emissions_profile_id, :footprint_id
    rename_column :transportation_profiles, :emissions_profile_id, :footprint_id
    rename_column :home_energy_profiles, :emissions_profile_id, :footprint_id
  end
end
