class CreateAirTravelProfiles < ActiveRecord::Migration
  def change
    create_table :air_travel_profiles do |t|
      t.integer :transportation_profile_id
      t.integer :d_economy
      t.integer :d_business
      t.integer :i_economy
      t.integer :i_premium_economy
      t.integer :i_business
      t.integer :i_first
      t.integer :sub_section_emissions

      t.timestamps null: false
    end
  end
end
