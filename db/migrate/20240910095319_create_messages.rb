class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :status
      t.string :category
      t.string :name
      t.jsonb :fields, default: '{}'

      t.timestamps
    end
  end
end
