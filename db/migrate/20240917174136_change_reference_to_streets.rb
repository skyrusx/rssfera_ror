class ChangeReferenceToStreets < ActiveRecord::Migration[7.1]
  def change
    remove_reference :streets, :city, null: false, foreign_key: true
  end
end
