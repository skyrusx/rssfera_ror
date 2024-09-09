class AddSlugToVacancies < ActiveRecord::Migration[7.1]
  def change
    add_column :vacancies, :slug, :string
  end
end
