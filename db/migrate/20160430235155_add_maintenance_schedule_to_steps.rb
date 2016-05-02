class AddMaintenanceScheduleToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :maintenance_schedule, index: true, foreign_key: true
  end
end
