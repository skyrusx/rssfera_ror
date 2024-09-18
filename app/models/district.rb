class District < ApplicationRecord
  belongs_to :city
  has_many :streets
  has_many :realties

  # def full_name
  #   "#{self.name} [#{self.city.name}]"
  # end
end
