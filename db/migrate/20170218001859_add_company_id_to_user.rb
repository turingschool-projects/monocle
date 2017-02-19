class AddCompanyIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :company, foreign_key: true
  end
end
