class Review < ApplicationRecord
  belongs_to :team_member
  has_one_attached :avatar

  after_save :update_team_member_rating

  scope :published, -> { where(status: "published") }

  STATUSES = {
    new: "Новый",
    published: "Опубликован",
    rejected: "Отклонен"
  }

  private

  def update_team_member_rating
    team_member = self.team_member
    reviews = Review.where(team_member_id: team_member.id)
    return if reviews.size.zero?
    rating = reviews.pluck(:rating).sum / reviews.size
    team_member.rating = (rating * 2.0).round / 2.0
    team_member.save
  end
end
