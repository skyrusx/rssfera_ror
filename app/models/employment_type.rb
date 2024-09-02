class EmploymentType < ApplicationRecord
  has_many :vacancy_employment_type_joins
  has_many :vacancies, through: :vacancy_employment_type_joins, source: :vacancy
end
