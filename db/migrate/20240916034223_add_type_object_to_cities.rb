class AddTypeObjectToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :type_object, :string
  end
end
