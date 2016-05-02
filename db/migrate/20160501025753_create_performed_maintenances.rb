class CreatePerformedMaintenances < ActiveRecord::Migration
  def change
    create_table :performed_maintenances do |t|
      t.references :maintenance, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
