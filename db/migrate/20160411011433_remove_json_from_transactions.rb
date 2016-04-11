class RemoveJsonFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :json, :json
  end
end
