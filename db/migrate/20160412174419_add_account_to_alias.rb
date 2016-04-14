class AddAccountToAlias < ActiveRecord::Migration
  def change
    add_reference :aliases, :account, index: true, foreign_key: true
  end
end
