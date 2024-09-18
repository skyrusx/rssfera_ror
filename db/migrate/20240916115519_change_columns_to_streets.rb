class ChangeColumnsToStreets < ActiveRecord::Migration[7.1]
  def change
    add_column :streets, :localized_name, :string
    add_column :streets, :localized_name_short, :string
    add_column :streets, :full_name, :string

    remove_column :streets, :type_object, :string
  end
end
