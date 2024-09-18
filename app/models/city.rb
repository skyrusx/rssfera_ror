class City < ApplicationRecord
  belongs_to :region
  has_many :realties
  has_many :districts

  scope :active, -> { where(status: true) }
end
