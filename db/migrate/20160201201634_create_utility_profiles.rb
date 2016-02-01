class CreateUtilityProfiles < ActiveRecord::Migration
  def change
    create_table :utility_profiles do |t|
      t.integer :home_energy_profile_id
      t.boolean :known
      t.string :name
      t.string :input_type
      t.float :input_amount
      t.integer :sub_section_emissions

      t.timestamps null: false
    end
  end
end
