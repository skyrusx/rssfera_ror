class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :status, default: true
      # t.has_many :realties
      # t.has_many :districts

      t.timestamps
    end
  end
end
