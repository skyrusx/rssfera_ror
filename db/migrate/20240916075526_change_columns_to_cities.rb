class ChangeColumnsToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :localized_name, :string
    add_column :cities, :localized_name_short, :string
    add_column :cities, :full_name, :string

    remove_column :cities, :type_object, :string
  end
end
