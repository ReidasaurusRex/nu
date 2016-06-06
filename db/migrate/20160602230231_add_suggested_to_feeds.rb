class AddSuggestedToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :suggested, :boolean
  end
end
