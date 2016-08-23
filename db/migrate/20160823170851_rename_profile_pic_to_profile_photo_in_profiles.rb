class RenameProfilePicToProfilePhotoInProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :profile_pic, :profile_photo
  end
end
