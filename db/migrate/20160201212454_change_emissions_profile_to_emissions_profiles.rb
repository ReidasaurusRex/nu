class ChangeEmissionsProfileToEmissionsProfiles < ActiveRecord::Migration
  def change
    rename_table :emissions_profile, :emissions_profiles
  end
end
