class CreateFindingTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :finding_technologies do |t|
      t.references :finding, foreign_key: true
      t.references :technology, foreign_key: true
    end
  end
end
