class CreateRealtyDistrictJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :realty_district_joins do |t|
      t.integer :realty_id
      t.integer :district_id

      t.timestamps
    end
  end
end
