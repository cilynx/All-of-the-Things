class AddMaintenanceScheduleToMaintenance < ActiveRecord::Migration
  def change
    add_reference :maintenances, :maintenance_schedule, index: true, foreign_key: true
  end
end
