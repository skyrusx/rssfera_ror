class District < ApplicationRecord
  belongs_to :city
  has_many :streets
  has_many :realty_district_joins
  has_many :realties, through: :realty_district_joins

  # def full_name
  #   "#{self.name} [#{self.city.name}]"
  # end
end
