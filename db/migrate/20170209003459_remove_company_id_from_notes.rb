class RemoveCompanyIdFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :notes, :company_id
  end
end
