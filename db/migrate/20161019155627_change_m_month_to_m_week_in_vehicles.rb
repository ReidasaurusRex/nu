class ChangeMMonthToMWeekInVehicles < ActiveRecord::Migration
  def change
    rename_column :vehicles, :mmonth, :mweek
  end
end
