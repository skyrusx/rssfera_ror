class ChangeColumnsToDistricts < ActiveRecord::Migration[7.1]
  def change
    add_column :districts, :localized_name, :string
    add_column :districts, :localized_name_short, :string
    add_column :districts, :full_name, :string
  end
end
