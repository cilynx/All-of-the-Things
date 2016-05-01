class RemoveReplecFromMaintenance < ActiveRecord::Migration
  def change
    remove_column :maintenances, :replecMiles, :integer
  end
end
