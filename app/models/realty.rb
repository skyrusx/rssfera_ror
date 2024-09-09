class Realty < ApplicationRecord
  belongs_to :team_member
  belongs_to :realty_category
  belongs_to :city
  belongs_to :district
  belongs_to :street

  has_many_attached :photos

  scope :active, -> { where(status: true) }

  TYPES = {
    1 => "Комната",
    2 => "Квартира",
    3 => "Загородный дом",
    4 => "Земельный участок",
    5 => "Коммерческая недвижимость",
    6 => "Гараж"
  }

  SPECIFICATIONS = {
    1 => { "section" => "О квартире", "field" => "Код объекта", "value" => "" },
    2 => { "section" => "О квартире", "field" => "Комнатность", "value" => "" },
    3 => { "section" => "О квартире", "field" => "Общая площадь", "value" => " м²" },
    4 => { "section" => "О квартире", "field" => "Площадь кухни", "value" => " м²" },
    5 => { "section" => "О квартире", "field" => "Ремонт", "value" => "" },
    6 => { "section" => "О квартире", "field" => "Количество спален", "value" => "" },
    7 => { "section" => "О квартире", "field" => "Санузел", "value" => "" },
    8 => { "section" => "О квартире", "field" => "Подключённые сервисы", "value" => "" },
    9 => { "section" => "О квартире", "field" => "Материал окон", "value" => "" },
    10 => { "section" => "О квартире", "field" => "Кондиционер", "value" => "" },
    11 => { "section" => "О квартире", "field" => "Кровать", "value" => "" },
    12 => { "section" => "О квартире", "field" => "Диван", "value" => "" },
    13 => { "section" => "О квартире", "field" => "Телевизор", "value" => "" },
    14 => { "section" => "О квартире", "field" => "Микроволновка", "value" => "" },
    15 => { "section" => "О квартире", "field" => "Холодильник", "value" => "" },
    16 => { "section" => "О квартире", "field" => "Плита", "value" => "" },
    17 => { "section" => "О квартире", "field" => "Кухонный гарнитур", "value" => "" },
    18 => { "section" => "О квартире", "field" => "Кухонный стол", "value" => "" },
    19 => { "section" => "О квартире", "field" => "Стулья", "value" => "" },
    20 => { "section" => "О доме", "field" => "Год постройки", "value" => "" },
    21 => { "section" => "О доме", "field" => "Этаж / Этажность", "value" => "" },
    22 => { "section" => "О доме", "field" => "Лифт", "value" => "" },
    23 => { "section" => "Подъезд", "field" => "Колясочная", "value" => "" },
    24 => { "section" => "Двор", "field" => "Двор", "value" => "" },
  }
end
