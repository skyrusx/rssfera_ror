class RemoveSpecificationsFromRealties < ActiveRecord::Migration[7.1]
  def change
    remove_column :realties, :specifications
  end
end
