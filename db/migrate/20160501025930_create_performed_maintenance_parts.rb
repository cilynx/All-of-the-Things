class CreatePerformedMaintenanceParts < ActiveRecord::Migration
  def change
    create_table :performed_maintenance_parts do |t|
      t.references :performed_maintenance, index: true, foreign_key: true
      t.references :part, index: true, foreign_key: true
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
