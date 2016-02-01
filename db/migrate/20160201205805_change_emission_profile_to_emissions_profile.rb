class ChangeEmissionProfileToEmissionsProfile < ActiveRecord::Migration
  def change
    rename_table :emission_profiles, :emissions_profile
  end
end
