class CreateTeamMemberJobTitleJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :team_member_job_title_joins do |t|
      t.integer :team_member_id
      t.integer :job_title_id

      t.timestamps
    end
  end
end
