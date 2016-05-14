class AddDataToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :data, :json
  end
end
