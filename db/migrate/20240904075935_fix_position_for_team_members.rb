class FixPositionForTeamMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :team_members, :position, :integer
    add_column :team_members, :position, :integer, default: 0, null: false
  end
end
