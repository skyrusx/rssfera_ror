class Vacancy < ApplicationRecord
  has_many :vacancy_employment_type_joins
  has_many :employment_types, through: :vacancy_employment_type_joins, source: :employment_type
  has_many :vacancy_skill_joins
  has_many :skills, through: :vacancy_skill_joins, source: :skill
  belongs_to :job_title
  belongs_to :team_member

  scope :active, -> { where(status: true) }

  INCOME_TYPES = ["на руки", "до вычета налогов"]
end
