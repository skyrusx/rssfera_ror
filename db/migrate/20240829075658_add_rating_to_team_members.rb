class AddRatingToTeamMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :team_members, :rating, :float
  end
end
