class VacancySkillJoin < ApplicationRecord
  belongs_to :vacancy
  belongs_to :skill
end
