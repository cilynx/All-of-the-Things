class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.date :date
      t.integer :odometer
      t.string :location
      t.references :vehicle, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
