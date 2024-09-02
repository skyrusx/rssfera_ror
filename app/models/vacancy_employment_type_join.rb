class VacancyEmploymentTypeJoin < ApplicationRecord
  belongs_to :vacancy
  belongs_to :employment_type
end
