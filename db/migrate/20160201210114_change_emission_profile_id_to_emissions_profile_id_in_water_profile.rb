class ChangeEmissionProfileIdToEmissionsProfileIdInWaterProfile < ActiveRecord::Migration
  def change
    rename_column :water_profiles, :emission_profile_id, :emissions_profile_id
  end
end
