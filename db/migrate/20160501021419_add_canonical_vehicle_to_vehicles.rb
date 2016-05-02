class AddCanonicalVehicleToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :canonical_vehicle, index: true, foreign_key: true
  end
end
