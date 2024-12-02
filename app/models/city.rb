class City < ApplicationRecord
  belongs_to :region
  has_many :districts
  has_many :streets
  has_many :realties

  scope :active, -> { where(status: true) }
end
