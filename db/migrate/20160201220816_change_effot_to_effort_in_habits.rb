class ChangeEffotToEffortInHabits < ActiveRecord::Migration
  def change
    rename_column :habits, :effot, :effort
  end
end
