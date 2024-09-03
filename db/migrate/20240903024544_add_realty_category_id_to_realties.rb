class AddRealtyCategoryIdToRealties < ActiveRecord::Migration[7.1]
  def change
    add_column :realties, :city_id, :integer
    add_column :realties, :district_id, :integer
    add_column :realties, :street_id, :integer
  end
end
