class AddSymbolToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :symbol, :string
  end
end
