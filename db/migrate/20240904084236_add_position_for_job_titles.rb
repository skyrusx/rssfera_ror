class AddPositionForJobTitles < ActiveRecord::Migration[7.1]
  def change
    add_column :job_titles, :position, :integer, default: 0, null: false
  end
end
