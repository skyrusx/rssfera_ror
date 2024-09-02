class AddDistrictIdToStreets < ActiveRecord::Migration[7.1]
  def change
    add_column :streets, :district_id, :integer
  end
end
