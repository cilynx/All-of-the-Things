class RemoveCanonFromVehicles < ActiveRecord::Migration
  def change
    remove_column :vehicles, :year, :integer
    remove_column :vehicles, :make, :string
    remove_column :vehicles, :model, :string
  end
end
