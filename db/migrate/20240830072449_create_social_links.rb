class CreateSocialLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_links do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :link

      t.timestamps
    end
  end
end
