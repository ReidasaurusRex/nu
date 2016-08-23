class AddCoverPhotoToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :cover_photo, :string
  end
end
