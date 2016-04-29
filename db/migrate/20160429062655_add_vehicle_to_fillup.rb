class AddVehicleToFillup < ActiveRecord::Migration
  def change
    add_reference :fillups, :vehicle, index: true, foreign_key: true
  end
end
