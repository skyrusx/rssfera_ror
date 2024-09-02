class CreateRealties < ActiveRecord::Migration[7.1]
  def change
    create_table :realties do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :slug
      t.string :location
      t.string :price
      t.string :payments
      t.text :description
      t.jsonb :specifications, default: '{}'
      t.string :type

      t.belongs_to :team_member
      t.belongs_to :realty_category
      # t.belongs_to :city
      # t.belongs_to :district
      # t.belongs_to :street

      t.timestamps
    end
  end
end
