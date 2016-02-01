class CreateDietProfiles < ActiveRecord::Migration
  def change
    create_table :diet_profiles do |t|
      t.integer :emissions_profile_id
      t.string :diet_type
      t.integer :section_emissions

      t.timestamps null: false
    end
  end
end
