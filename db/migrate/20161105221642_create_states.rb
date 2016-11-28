class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.citext :name

      t.timestamps
    end

    add_reference :companies, :state, foreign_key: true
  end
end
