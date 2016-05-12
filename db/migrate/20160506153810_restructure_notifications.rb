class RestructureNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :source_id
    remove_column :notifications, :type

    add_column :notifications, :image, :string
    add_column :notifications, :text, :string
    add_column :notifications, :link, :string
  end
end
