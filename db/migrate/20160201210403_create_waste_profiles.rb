class CreateWasteProfiles < ActiveRecord::Migration
  def change
    create_table :waste_profiles do |t|
      t.integer :emissions_profile_id
      t.boolean :glass
      t.boolean :metal
      t.boolean :plastic
      t.boolean :newspaper
      t.boolean :magazines
      t.integer :section_emissions

      t.timestamps null: false
    end
  end
end
