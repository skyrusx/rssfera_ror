class RemoveJobTitlesFromTeamMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :team_members, :job_titles
  end
end
