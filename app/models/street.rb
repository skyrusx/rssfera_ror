class Street < ApplicationRecord
  belongs_to :city
  belongs_to :district
  has_many :realties

  # def full_name
  #   "#{self.name} [#{self.district.name}] [#{self.district.city.name}]"
  # end
end
