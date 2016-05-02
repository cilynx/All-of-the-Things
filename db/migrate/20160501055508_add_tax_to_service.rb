class AddTaxToService < ActiveRecord::Migration
  def change
    add_column :services, :tax, :decimal
  end
end
