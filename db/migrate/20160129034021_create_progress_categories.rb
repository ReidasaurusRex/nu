class CreateProgressCategories < ActiveRecord::Migration
  def change
    create_table :progress_categories do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
