class AddPositionToTeamMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :position, :integer
  end
end
