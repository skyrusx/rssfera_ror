class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :email
      t.text :feedback
      t.float :rating
      t.datetime :published_at
      t.belongs_to :team_member

      t.timestamps
    end
  end
end
