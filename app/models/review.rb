class Review < ApplicationRecord
  belongs_to :team_member
  has_one_attached :avatar

  after_save :update_team_member_rating

  scope :published, -> {
    where(
      "published_at <= :published_at and status = :status",
      published_at: Time.zone.now, status: "published"
    ).where.not(published_at: nil)
  }

  STATUSES = {
    new: "Новый",
    published: "Опубликован",
    rejected: "Отклонен"
  }

  private

  def update_team_member_rating
    team_member = self.team_member
    reviews = team_member.reviews.published
    return if reviews.size.zero?
    rating = reviews.pluck(:rating).sum / reviews.size
    team_member.rating = (rating * 2.0).round / 2.0
    team_member.save
  end
end
