class ChangeColumnsForStreets < ActiveRecord::Migration[7.1]
  def change
    remove_column :streets, :full_name, :string
    add_column :streets, :complete_name, :string
  end
end
