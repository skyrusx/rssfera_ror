class CreateRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :localized_name
      t.string :localized_name_short
      t.belongs_to :country

      t.timestamps
    end
  end
end
