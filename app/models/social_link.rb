class SocialLink < ApplicationRecord
  scope :active, -> { where(status: true) }
end
