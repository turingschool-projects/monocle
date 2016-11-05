class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.citext :name

      t.timestamps
    end

    add_reference :companies, :city, foreign_key: true
  end
end
