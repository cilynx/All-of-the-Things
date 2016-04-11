class AddAccountToTransaction < ActiveRecord::Migration
  def change
    add_reference :transactions, :account, index: true, foreign_key: true
  end
end
