class CreateSharingSettings < ActiveRecord::Migration
  def change
    create_table :sharing_settings do |t|
      t.integer :profile_id
      t.boolean :improvements
      t.boolean :follow
      t.boolean :footprint

      t.timestamps null: false
    end
  end
end
