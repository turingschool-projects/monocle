class AddCensusIdToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :census_id, :integer
  end
end
