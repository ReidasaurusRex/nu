class CreateStartedHabits < ActiveRecord::Migration
  def change
    create_table :started_habits do |t|
      t.integer :profile_id
      t.integer :habit_id
      t.integer :progress_category_id
      t.integer :check_ins

      t.timestamps null: false
    end
  end
end
