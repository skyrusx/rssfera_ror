class AddSlugToRealtyCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :realty_categories, :slug, :string
  end
end
