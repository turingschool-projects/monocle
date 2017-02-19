class AddCompanyIdToFinding < ActiveRecord::Migration[5.0]
  def change
    add_reference :findings, :company, foreign_key: true
  end
end
