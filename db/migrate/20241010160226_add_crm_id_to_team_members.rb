class AddCrmIdToTeamMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :crm_id, :integer
  end
end
