class RemoveOldSharingSettingsColumns < ActiveRecord::Migration
  def change
    remove_column :sharing_settings, :improvements
    remove_column :sharing_settings, :follow
    remove_column :sharing_settings, :footprint
  end
end
