class CreateRealtyCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :realty_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
