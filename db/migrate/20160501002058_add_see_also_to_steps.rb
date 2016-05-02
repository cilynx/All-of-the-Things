class AddSeeAlsoToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :seeAlso, :string, array: true
  end
end
