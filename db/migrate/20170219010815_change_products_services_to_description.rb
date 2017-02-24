class ChangeProductsServicesToDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :products_services, :description
  end
end
