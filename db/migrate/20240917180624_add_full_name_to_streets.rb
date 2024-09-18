class AddFullNameToStreets < ActiveRecord::Migration[7.1]
  def change
    add_column :streets, :full_name, :string
  end
end
