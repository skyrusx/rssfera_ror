class CreatePartners < ActiveRecord::Migration[7.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :anchor
      t.text :description

      t.timestamps
    end
  end
end
