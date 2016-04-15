class RemoveCrapFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :aliases, :array
    remove_column :vendors, :tags, :array
  end
end
