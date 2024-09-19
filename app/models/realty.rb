class Realty < ApplicationRecord
  belongs_to :team_member
  belongs_to :realty_category
  belongs_to :city
  belongs_to :district
  belongs_to :street

  has_many_attached :photos do |attachable|
    attachable.variant :medium, resize_to_limit: [800, 450]
  end

  after_create :fill_slug

  scope :active, -> { where(status: true) }

  TYPES = {
    1 => "Комната",
    2 => "Квартира",
    3 => "Дом",
    4 => "Земельный участок",
    5 => "Коммерческая недвижимость",
    6 => "Гараж"
  }

  MENU_TYPES = {
    1 => "Комнату",
    2 => "Квартиру",
    3 => "Дом",
    4 => "Земельный участок",
    5 => "Коммерческую недвижимость",
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

  ROOM_SIZES = {
    1 => "1 комната",
    2 => "2 комнаты",
    3 => "3 комнаты",
    4 => "4 комнаты",
    5 => "5 и более",
    6 => "Другое",
  }

  CONDITIONS = {
    1 => "Без ремонта",
    2 => "Требуется ремонт",
    3 => "Обычное состояние",
    4 => "Отличное состояние",
  }

  COMMUNICATION_METHODS = {
    1 => "Позвонить",
    2 => "WhatsApp",
    3 => "Telegram"
  }

  private

  def fill_slug
    slug = [self.realty_category_id, self.team_member_id, self.city_id, self.district_id, self.street_id].compact.join("")
    self.slug = [slug, self.id].join("-")
    self.save
  end
end
