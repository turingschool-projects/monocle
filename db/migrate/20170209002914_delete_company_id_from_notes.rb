class DeleteCompanyIdFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :notes, column: :company_id
  end
end
