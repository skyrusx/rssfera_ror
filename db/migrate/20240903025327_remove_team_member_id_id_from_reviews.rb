class RemoveTeamMemberIdIdFromReviews < ActiveRecord::Migration[7.1]
  def change
    if ActiveRecord::Base.connection.column_exists?(:reviews, :team_member_id_id)
      remove_column :reviews, :team_member_id_id
    end
  end
end
