class CreateMaintenanceSchedules < ActiveRecord::Migration
  def change
    create_table :maintenance_schedules do |t|

      t.timestamps null: false
    end
  end
end
