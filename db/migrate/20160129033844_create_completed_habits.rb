class CreateCompletedHabits < ActiveRecord::Migration
  def change
    create_table :completed_habits do |t|
      t.integer :profile_id
      t.integer :habit_id
      t.integer :progress_category_id

      t.timestamps null: false
    end
  end
end
