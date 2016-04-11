class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :institution
      t.string :name

      t.timestamps null: false
    end
  end
end
