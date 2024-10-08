class ChangeColumnsToRealties < ActiveRecord::Migration[7.1]
  def change
    remove_column :realties, :location, :string

    add_column :realties, :crm_id, :integer
  end
end
