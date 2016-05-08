class AddZpidToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :zpid, :integer
  end
end
