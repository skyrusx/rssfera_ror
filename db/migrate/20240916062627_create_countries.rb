class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :localized_name
      t.string :currency_code
      t.string :currency_symbol

      t.timestamps
    end
  end
end
