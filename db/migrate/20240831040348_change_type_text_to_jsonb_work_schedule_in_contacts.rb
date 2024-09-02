class ChangeTypeTextToJsonbWorkScheduleInContacts < ActiveRecord::Migration[7.1]
  def change
    # change_column :contacts, :work_schedule, :text, using: 'work_schedule::jsonb'
    remove_column :contacts, :work_schedule, :text
    add_column :contacts, :work_schedule, :jsonb, default: '{}'
  end
end
