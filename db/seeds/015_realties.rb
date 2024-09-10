# Realties
puts "Seeding Realties..."

Realty.all.each do |realty|
  realty.photos.purge
end

Realty.delete_all
ActiveRecord::Base.connection.execute("TRUNCATE TABLE realties RESTART IDENTITY")

realties = [
  {
    name: "4-комн. кв. 89 м² этаж 5/5", status: true, price: "8100000", type_object: Realty::TYPES[2],
    specifications: {
      1 => { "section" => "О квартире", "field" => "Код объекта", "value" => "3755615" },
      2 => { "section" => "О квартире", "field" => "Комнатность", "value" => "4-комн" },
      3 => { "section" => "О квартире", "field" => "Общая площадь", "value" => "89 м²" },
      4 => { "section" => "О квартире", "field" => "Площадь кухни", "value" => "15 м²" },
      5 => { "section" => "О квартире", "field" => "Ремонт", "value" => "Современный ремонт" },
      6 => { "section" => "О квартире", "field" => "Количество спален", "value" => "2" },
      7 => { "section" => "О квартире", "field" => "Санузел", "value" => "Совмещенный" },
      8 => { "section" => "О квартире", "field" => "Подключённые сервисы", "value" => "Интернет, кабельное телевидение" },
      9 => { "section" => "О квартире", "field" => "Материал окон", "value" => "Пластиковые" },
      10 => { "section" => "О квартире", "field" => "Кондиционер", "value" => "Есть" },
      11 => { "section" => "О квартире", "field" => "Кровать", "value" => "Есть" },
      12 => { "section" => "О квартире", "field" => "Диван", "value" => "Есть" },
      13 => { "section" => "О квартире", "field" => "Телевизор", "value" => "Есть" },
      14 => { "section" => "О квартире", "field" => "Микроволновка", "value" => "Есть" },
      15 => { "section" => "О квартире", "field" => "Холодильник", "value" => "Есть" },
      16 => { "section" => "О квартире", "field" => "Плита", "value" => "Электрическая" },
      17 => { "section" => "О квартире", "field" => "Кухонный гарнитур", "value" => "Есть" },
      18 => { "section" => "О квартире", "field" => "Кухонный стол", "value" => "Есть" },
      19 => { "section" => "О квартире", "field" => "Стулья", "value" => "Есть" },
      20 => { "section" => "О доме", "field" => "Год постройки", "value" => "2013" },
      21 => { "section" => "О доме", "field" => "Этаж / Этажность", "value" => "3 из 12" },
      22 => { "section" => "О доме", "field" => "Лифт", "value" => "Пассажирский и грузовой" },
      23 => { "section" => "Подъезд", "field" => "Колясочная", "value" => "Есть" },
      24 => { "section" => "Двор", "field" => "Двор", "value" => "Закрытый двор" },
    },
    description: <<-HTML
<p>Рядом два садика, две школы, конечная автобуса 5 и не далеко- автобуса 18. Под окнами парковка, детская и спортивная площадки, очень зелёный двор. Памятник Алёши для прогулок, ниже - памятник "Ждущей" дом творчества Лапландия 10 минут пешком. Рядом торговый центр "Встречи" где есть всё: "Сити Гурмэ", ФиксПрайс, Озон, ремонт обуви, фотоателье, почта, аптека и т.д. Очень хорошие тихие соседи.</p>
    HTML
  },
  {
    name: "4-комн. кв. 89 м² этаж 5/5", status: true, price: "8100000", type_object: Realty::TYPES[2],
    specifications: {
      1 => { "section" => "О квартире", "field" => "Код объекта", "value" => "3755615" },
      2 => { "section" => "О квартире", "field" => "Комнатность", "value" => "4-комн" },
      3 => { "section" => "О квартире", "field" => "Общая площадь", "value" => "89 м²" },
      4 => { "section" => "О квартире", "field" => "Площадь кухни", "value" => "15 м²" },
      5 => { "section" => "О квартире", "field" => "Ремонт", "value" => "Современный ремонт" },
      6 => { "section" => "О квартире", "field" => "Количество спален", "value" => "2" },
      7 => { "section" => "О квартире", "field" => "Санузел", "value" => "Совмещенный" },
      8 => { "section" => "О квартире", "field" => "Подключённые сервисы", "value" => "Интернет, кабельное телевидение" },
      9 => { "section" => "О квартире", "field" => "Материал окон", "value" => "Пластиковые" },
      10 => { "section" => "О квартире", "field" => "Кондиционер", "value" => "Есть" },
      11 => { "section" => "О квартире", "field" => "Кровать", "value" => "Есть" },
      12 => { "section" => "О квартире", "field" => "Диван", "value" => "Есть" },
      13 => { "section" => "О квартире", "field" => "Телевизор", "value" => "Есть" },
      14 => { "section" => "О квартире", "field" => "Микроволновка", "value" => "Есть" },
      15 => { "section" => "О квартире", "field" => "Холодильник", "value" => "Есть" },
      16 => { "section" => "О квартире", "field" => "Плита", "value" => "Электрическая" },
      17 => { "section" => "О квартире", "field" => "Кухонный гарнитур", "value" => "Есть" },
      18 => { "section" => "О квартире", "field" => "Кухонный стол", "value" => "Есть" },
      19 => { "section" => "О квартире", "field" => "Стулья", "value" => "Есть" },
      20 => { "section" => "О доме", "field" => "Год постройки", "value" => "2013" },
      21 => { "section" => "О доме", "field" => "Этаж / Этажность", "value" => "3 из 12" },
      22 => { "section" => "О доме", "field" => "Лифт", "value" => "Пассажирский и грузовой" },
      23 => { "section" => "Подъезд", "field" => "Колясочная", "value" => "Есть" },
      24 => { "section" => "Двор", "field" => "Двор", "value" => "Закрытый двор" },
    },
    description: <<-HTML
<p>Рядом два садика, две школы, конечная автобуса 5 и не далеко- автобуса 18. Под окнами парковка, детская и спортивная площадки, очень зелёный двор. Памятник Алёши для прогулок, ниже - памятник "Ждущей" дом творчества Лапландия 10 минут пешком. Рядом торговый центр "Встречи" где есть всё: "Сити Гурмэ", ФиксПрайс, Озон, ремонт обуви, фотоателье, почта, аптека и т.д. Очень хорошие тихие соседи.</p>
    HTML
  }
]

realties.each.with_index(1) do |realty_data, index|
  (1..8).each do |subindex|
    realty = Realty.create(realty_data)

    (1..8).each do |photo_index|
      realty.photos.attach(
        io: File.open(File.join(Rails.root, "app/assets/images/realty/realty.jpeg")),
        filename: "realty-#{photo_index}.jpeg"
      )
    end

    street = Street.find_by_name("Улица Полярные Зори")
    district = street.district
    city = street.district.city

    realty.city_id = city.id
    realty.district_id = district.id
    realty.street_id = street.id
    realty.location = ["г. #{city.name}", street.name.gsub("Улица", "ул."), "41 корпус 4"].join(", ")

    realty.slug = realty.specifications["1"]["value"]
    realty.payments = (realty.price.to_f / realty.specifications["3"]["value"].to_f).round

    tm_last_name = case subindex
                   when 1 then "Кулишов"
                   when 2 then "Кулишова"
                   when 3 then "Волошина"
                   when 4 then "Фомченко"
                   when 5 then "Новожилов"
                   when 6 then "Захарова"
                   when 7 then "Медведева"
                   else "Стрелец"
                   end

    team_member = TeamMember.find_by_last_name(tm_last_name)

    realty.team_member_id = team_member.id
    realty.realty_category_id = index == 1 ? RealtyCategory.first.id : RealtyCategory.last.id
    realty.save

    puts "Объект недвижимости создан: #{realty.name}"
  end
end

puts "Seeding Realties completed!"
# Realties End
