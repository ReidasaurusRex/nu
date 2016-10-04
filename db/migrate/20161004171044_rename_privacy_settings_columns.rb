class RenamePrivacySettingsColumns < ActiveRecord::Migration
  def change
    rename_column :privacy_settings, :display_location, :location
    rename_column :privacy_settings, :display_feed, :feed
  end
end
