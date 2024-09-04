class JobTitle < ApplicationRecord
  has_many :team_member_job_title_joins
  has_many :team_members, through: :team_member_job_title_joins, source: :team_member
  has_many :vacancy_employment_type_joins
  has_many :vacancies, through: :vacancy_employment_type_joins, source: :vacancy
  has_many :vacancies

  is_positionable start: 1

  scope :active, -> { where(status: true) }

  def employees
    self.team_members.select { |tm| tm.job_titles.ids.include?(self.id) }
  end
end
