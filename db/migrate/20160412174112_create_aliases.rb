class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :payee
      t.string :memo
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
