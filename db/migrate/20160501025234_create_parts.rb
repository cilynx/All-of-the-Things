class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :pn
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
