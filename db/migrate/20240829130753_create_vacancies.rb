class CreateVacancies < ActiveRecord::Migration[7.1]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :location
      t.belongs_to :job_title
      t.string :experience
      t.string :income_from
      t.string :income_to
      t.string :income_type
      t.datetime :published_at
      t.text :description
      t.belongs_to :team_member
      t.text :more_info

      t.timestamps
    end
  end
end
