class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.text :name
      t.text :aliases, array: true, default: []
      t.text :tags, array: true, default: []

      t.timestamps null: false
    end
  end
end
