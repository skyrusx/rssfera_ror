class AddStatusToRealtyCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :realty_categories, :status, :boolean, default: true
  end
end
