class RemoveComissionFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :comission, :decimal
  end
end
