class CreateTeamMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic_name
      t.string :slug
      t.string :phone
      t.string :email
      t.text :info
      t.boolean :whatsapp, default: false

      t.timestamps
    end
  end
end
