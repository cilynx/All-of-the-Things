class AddUserToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :user, index: true, foreign_key: true
  end
end
