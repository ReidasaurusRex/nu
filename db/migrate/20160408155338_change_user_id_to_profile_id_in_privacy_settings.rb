class ChangeUserIdToProfileIdInPrivacySettings < ActiveRecord::Migration
  def change
    rename_column :privacy_settings, :user_id, :profile_id
  end
end
