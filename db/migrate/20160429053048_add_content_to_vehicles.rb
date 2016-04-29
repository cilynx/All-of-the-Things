class AddContentToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :content_type, :string
  end
end
