class City < ApplicationRecord
  has_many :realties
  has_many :districts

  scope :active, -> { where(status: true) }
end
