class RemoveMaintenanceScheduleFromSteps < ActiveRecord::Migration
  def change
    remove_reference :steps, :maintenance_schedule, index: true, foreign_key: true
  end
end
