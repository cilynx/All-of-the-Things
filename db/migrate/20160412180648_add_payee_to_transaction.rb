class AddPayeeToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :payee, :string
  end
end
