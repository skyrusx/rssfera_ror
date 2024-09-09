class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :page
      t.string :page_name
      t.string :meta_title
      t.text :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
