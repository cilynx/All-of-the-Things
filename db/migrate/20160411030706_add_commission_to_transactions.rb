class AddCommissionToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :commission, :decimal
  end
end
