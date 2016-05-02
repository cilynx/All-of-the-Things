class AddReplaceToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :replaceMiles, :integer
  end
end
