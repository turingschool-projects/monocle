class RemoveFindingIFromTechnologies < ActiveRecord::Migration[5.0]
  def change
    remove_column :technologies, :finding_id
  end
end
