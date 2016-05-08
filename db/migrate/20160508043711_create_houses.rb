class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
