class CreatePublicTransportationProfiles < ActiveRecord::Migration
  def change
    create_table :public_transportation_profiles do |t|
      t.integer :transportation_profile_id
      t.boolean :use
      t.integer :metro
      t.integer :commuter
      t.integer :inter_city
      t.integer :bus
      t.integer :taxi
      t.integer :sub_section_emissions

      t.timestamps null: false
    end
  end
end
