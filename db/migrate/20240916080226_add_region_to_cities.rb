class AddRegionToCities < ActiveRecord::Migration[7.1]
  def change
    add_reference :cities, :region, null: false, foreign_key: true
  end
end
