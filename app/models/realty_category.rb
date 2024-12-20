class RealtyCategory < ApplicationRecord
  has_many :realties

  after_create :fill_slug

  scope :active, -> { where(status: true) }

  private

  def fill_slug
    return if self.slug.present?

    self.slug = self.name.parameterize
    self.save
  end
end
