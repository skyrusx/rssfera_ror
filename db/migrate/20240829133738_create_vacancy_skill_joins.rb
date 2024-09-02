class CreateVacancySkillJoins < ActiveRecord::Migration[7.1]
  def change
    create_table :vacancy_skill_joins do |t|
      t.integer :vacancy_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
