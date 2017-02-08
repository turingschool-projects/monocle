class CreateCompanyNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :company_notes do |t|
      t.references :company, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
