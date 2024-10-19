class AddLatitudeToRealties < ActiveRecord::Migration[7.1]
  def change
    add_column :realties, :latitude, :string
  end
end
