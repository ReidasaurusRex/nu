class DropDisplayStatsFromPrivacySettings < ActiveRecord::Migration
  def change
    remove_column :privacy_settings, :display_stats
  end
end
