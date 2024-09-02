class AddStatusToJobTitles < ActiveRecord::Migration[7.1]
  def change
    add_column :job_titles, :status, :boolean, default: true
  end
end
