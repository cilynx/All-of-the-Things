class AddMaintenanceToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :maintenance, index: true, foreign_key: true
  end
end
