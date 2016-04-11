class AddPropertiesToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :quantity, :decimal
    add_column :transactions, :comission, :decimal
    add_column :transactions, :memo, :text
  end
end
