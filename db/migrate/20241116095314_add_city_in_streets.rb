class AddCityInStreets < ActiveRecord::Migration[7.1]
  def change
    add_reference :streets, :city
  end
end
