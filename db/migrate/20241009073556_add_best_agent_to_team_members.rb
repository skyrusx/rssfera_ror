class AddBestAgentToTeamMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :best_agent, :boolean, default: false
  end
end
