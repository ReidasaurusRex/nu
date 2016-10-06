class DropSharingSettings < ActiveRecord::Migration
  def change
    drop_table :sharing_settings
  end
end
