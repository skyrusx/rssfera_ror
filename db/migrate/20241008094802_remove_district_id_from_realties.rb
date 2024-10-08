class RemoveDistrictIdFromRealties < ActiveRecord::Migration[7.1]
  def change
    remove_column :realties, :district_id
  end
end
