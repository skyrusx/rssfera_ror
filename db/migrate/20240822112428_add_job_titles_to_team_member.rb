class AddJobTitlesToTeamMember < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :job_titles, :text, array: true, default: []
  end
end
