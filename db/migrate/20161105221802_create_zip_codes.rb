class CreateZipCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zip_codes do |t|
      t.string :zip_code

      t.timestamps
    end

    add_reference :companies, :zip_code, foreign_key: true
  end
end
