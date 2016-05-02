class AddMaintenanceScheduleToCanonicalVehicle < ActiveRecord::Migration
  def change
    add_reference :canonical_vehicles, :maintenance_schedule, index: true, foreign_key: true
  end
end
