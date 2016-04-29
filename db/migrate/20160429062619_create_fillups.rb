class CreateFillups < ActiveRecord::Migration
  def change
    create_table :fillups do |t|
      t.date :date
      t.integer :odometer
      t.decimal :gallons
      t.decimal :ppg
      t.string :brand
      t.string :grade

      t.timestamps null: false
    end
  end
end
