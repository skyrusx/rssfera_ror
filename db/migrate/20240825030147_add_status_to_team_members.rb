class AddStatusToTeamMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :status, :boolean, default: true
  end
end
