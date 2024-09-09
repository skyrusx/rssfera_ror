class AddPositionForPartners < ActiveRecord::Migration[7.1]
  def change
    add_column :partners, :position, :integer, default: 0, null: false
  end
end
