class CreateStreets < ActiveRecord::Migration[7.1]
  def change
    create_table :streets do |t|
      t.string :name

      # t.belongs_to :district
      # t.has_many :realties

      t.timestamps
    end
  end
end
