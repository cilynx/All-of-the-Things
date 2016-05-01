class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :text
      t.string :imageMD5

      t.timestamps null: false
    end
  end
end
