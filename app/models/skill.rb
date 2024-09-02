class Skill < ApplicationRecord
  has_many :vacancy_skill_joins
  has_many :vacancies, through: :vacancy_skill_joins, source: :vacancy
end
