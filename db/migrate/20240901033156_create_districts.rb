class CreateDistricts < ActiveRecord::Migration[7.1]
  def change
    create_table :districts do |t|
      t.string :name

      # t.belongs_to :city
      # t.has_many :realties

      t.timestamps
    end
  end
end
