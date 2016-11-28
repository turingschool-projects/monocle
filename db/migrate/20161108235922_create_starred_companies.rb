class CreateStarredCompanies < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :companies, table_name: :starred_companies do |t|
      t.timestamps
    end
  end
end
