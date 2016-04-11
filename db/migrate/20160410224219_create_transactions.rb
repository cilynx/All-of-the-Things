class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :action
      t.references :vendor, index: true, foreign_key: true
      t.decimal :price
      t.json :json

      t.timestamps null: false
    end
  end
end
