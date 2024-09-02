class CreateVacancyEmploymentTypeJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :vacancy_employment_type_joins do |t|
      t.integer :vacancy_id
      t.integer :employment_type_id

      t.timestamps
    end
  end
end
