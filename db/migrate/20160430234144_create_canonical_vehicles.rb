class CreateCanonicalVehicles < ActiveRecord::Migration
  def change
    create_table :canonical_vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year

      t.timestamps null: false
    end
  end
end
