class DropProfileHabits < ActiveRecord::Migration
  def change
    drop_table :profile_habits
  end
end
