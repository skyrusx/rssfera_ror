class ChangeColumnsForRealties < ActiveRecord::Migration[7.1]
  def change
    add_column :realties, :total_area, :float
    add_column :realties, :living_area, :float
    add_column :realties, :kitchen_area, :float
    add_column :realties, :floor, :integer
    add_column :realties, :floors, :integer
    add_column :realties, :number_rooms, :integer
    add_column :realties, :balcony, :integer
    add_column :realties, :layout, :string
    add_column :realties, :house, :string
    add_column :realties, :flat, :string

    remove_column :realties, :price, :string
    add_column :realties, :price, :float
  end
end
