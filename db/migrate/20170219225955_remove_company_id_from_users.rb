class RemoveCompanyIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :company_id
  end
end
