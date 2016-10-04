class AddLastNameToPrivacySettings < ActiveRecord::Migration
  def change
    add_column :privacy_settings, :last_name, :boolean
  end
end
