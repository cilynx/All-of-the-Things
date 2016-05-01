class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :item
      t.string :page
      t.integer :pdf
      t.integer :inspectMiles
      t.integer :inspectMonths
      t.integer :replecMiles
      t.integer :replaceMonths

      t.timestamps null: false
    end
  end
end
