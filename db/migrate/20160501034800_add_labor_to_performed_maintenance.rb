class AddLaborToPerformedMaintenance < ActiveRecord::Migration
  def change
    add_column :performed_maintenances, :laborHours, :decimal
    add_column :performed_maintenances, :laborRate, :decimal
  end
end
