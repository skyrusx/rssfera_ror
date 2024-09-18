class ChangeBalconyToRealties < ActiveRecord::Migration[7.1]
  def change
    remove_column :realties, :balcony, :integer
    add_column :realties, :balcony, :boolean, default: true
  end
end
