class Partner < ApplicationRecord
  has_one_attached :logo

  is_positionable start: 1

  scope :active, -> { where(status: true) }
end
