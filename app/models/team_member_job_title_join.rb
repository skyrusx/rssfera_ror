class TeamMemberJobTitleJoin < ApplicationRecord
  belongs_to :team_member
  belongs_to :job_title
end
