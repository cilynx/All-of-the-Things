class AddFourToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :four, :integer
  end
end
