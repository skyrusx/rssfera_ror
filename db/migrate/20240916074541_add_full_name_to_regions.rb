class AddFullNameToRegions < ActiveRecord::Migration[7.1]
  def change
    add_column :regions, :full_name, :string
  end
end
