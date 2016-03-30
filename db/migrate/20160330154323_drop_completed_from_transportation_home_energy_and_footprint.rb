class DropCompletedFromTransportationHomeEnergyAndFootprint < ActiveRecord::Migration
  def change
    remove_column :home_energies, :completed
    remove_column :transportations, :completed
    remove_column :footprints, :completed
  end
end
