class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :note
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
