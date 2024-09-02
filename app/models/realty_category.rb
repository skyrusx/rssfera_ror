class RealtyCategory < ApplicationRecord
  has_many :realties

  scope :active, -> { where(status: true) }
end
