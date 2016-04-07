class DropProgressCategories < ActiveRecord::Migration
  def change
    drop_table :progress_categories
  end
end
