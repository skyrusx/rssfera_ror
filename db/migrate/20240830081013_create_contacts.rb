class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :address_full
      t.string :address_short
      t.string :phone
      t.string :email
      t.text :work_schedule
      t.string :self_emloyed
      t.string :inn

      t.timestamps
    end
  end
end
