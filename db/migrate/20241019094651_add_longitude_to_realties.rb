class AddLongitudeToRealties < ActiveRecord::Migration[7.1]
  def change
    add_column :realties, :longitude, :string
  end
end
