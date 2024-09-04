class ChangePositionForTeamMembers < ActiveRecord::Migration[7.1]
  def change
    change_column :team_members, :position, :integer, default: 0, null: false
  end
end
