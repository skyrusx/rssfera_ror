class AddColumnsToDistricts < ActiveRecord::Migration[7.1]
  def change
    add_column :districts, :city_id, :integer
  end
end
