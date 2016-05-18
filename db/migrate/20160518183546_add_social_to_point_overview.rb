class AddSocialToPointOverview < ActiveRecord::Migration
  def change
    add_column :point_overviews, :social, :integer
  end
end
