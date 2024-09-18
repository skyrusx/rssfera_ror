class AddTypeObjectToStreets < ActiveRecord::Migration[7.1]
  def change
    add_column :streets, :type_object, :string
  end
end
