class ChangeTypeToTypeObjectInRealties < ActiveRecord::Migration[7.1]
  def change
    remove_column :realties, :type, :string
    add_column :realties, :type_object, :string
  end
end
