require "csv"

namespace :import do
  desc "Импорт объектов недвижимости"
  task realties: :environment do
    puts "Начало"

    file_path = Rails.root.join("public", "apartments.csv")
    rows = CSV.parse(File.read(file_path), col_sep: ";")[1..-1]
    rows.each do |row|
      realty_data = row

      city_name = realty_data[15]
      city = City.find_by(name: city_name)

      district = if realty_data[19].nil?
                   District.find_by(city_id: city&.id)
                 else
                   District.find_by(name: realty_data[19], city_id: city&.id)
                 end

      realty_data[16] = realty_data[16] == "Полярный Круг" ? "Полярный круг" : realty_data[16]
      realty_data[16] = realty_data[16] == "Молодежный" ? "Молодежная" : realty_data[16]

      street = Street.find_by(name: realty_data[16], district_id: district.id)
      if street.nil?
        district_ids = City.find_by(name: city.name).districts.ids
        st = Street.find_by(district_id: district_ids, name: realty_data[16])
        if st.present?
          district = District.find_by(id: st.district_id)
          street = st
        end
      end

      if realty_data[16] == "Образцовая"
        street = Street.create({ name: "Образцовая", localized_name: "улица", localized_name_short: "ул.", full_name: "Образцовая улица", district_id: district.id })
      end
      if realty_data[16] == "СНТ Свой дом, участок № 178"
        street = Street.create({ name: "Свой дом", localized_name: "садоводческое некоммерческое товарищество", localized_name_short: "снт", full_name: "СНТ Свой дом", district_id: district.id })
        house = "участок № 178"
      end
      if realty_data[16] == "Автогородок 53 А 2 очередь"
        street = Street.create({ name: "Автогородок", localized_name: "автогородок", localized_name_short: "авто г-к", full_name: "СНТ Свой дом", district_id: district.id })
        house = "53 А 2 очередь"
      end

      realty_title = realty_name(
        realty_data[20],
        realty_data[12],
        realty_data[1],
        realty_data[7],
        [realty_data[10], realty_data[11]]
      )

      realty_params = {
        status: true,
        name: realty_title,
        type_object: realty_type(realty_data[1]),
        price: realty_data[6].to_f,
        total_area: realty_data[7].to_f,
        living_area: realty_data[8].to_f,
        kitchen_area: realty_data[9].to_f,
        floor: realty_data[10].to_i,
        floors: realty_data[11].to_i,
        number_rooms: realty_data[12].to_i,
        balcony: balcony_value(realty_data[13]),
        layout: layout_value(realty_data[14]),
        city_id: city.id,
        district_id: district.id,
        street_id: street.id,
        house: house || realty_data[17].to_s,
        flat: realty_data[18].to_s,
        realty_category_id: RealtyCategory.find_by(name: realty_data[20]&.capitalize)&.id,
        team_member_id: TeamMember.find_by(phone: realty_data[4])&.id
      }

      # p realty_params
      realty = Realty.create(realty_params)
      puts "Недвижимость '#{realty.name}' добавлена"
    end

    puts "Завершено!"
  end

  def realty_name(category, rooms, type, square, floor_data)
    category = category.to_s.downcase

    category_name = case category
                    when "продажа" then "Продается"
                    when "аренда" then "Сдается"
                    when "сопровождение" then "Сопровождение"
                    else ""
                    end

    rooms = rooms.to_i
    room_name = rooms.zero? ? "" : "#{rooms}-комн."

    type_short = case type.downcase
                 when "квартира" then "кв."
                 when "дом" then "дом"
                 when "ком.недвижимость" then "ком.недв."
                 when "гараж" then "гараж"
                 when "комната" then "комната"
                 end

    square_name = [square, "м²"].join(" ")

    floor, floors = floor_data.map(&:to_i)
    floor_params = if type_short == "дом" && (floor.zero? || floors.zero?)
                     "1/1"
                   elsif type_short == "гараж" && (floor.zero? || floors.zero?)
                     "1/1"
                   else
                     [floor, floors].join("/")
                   end
    floor_name = "этаж #{floor_params}"

    if type_short == "комната"
      [category_name, "1 #{type_short}", "в", room_name, "кв.", floor_name].reject { |c| c.empty? }.join(" ")
    else
      [
        category_name,
        room_name,
        type_short,
        square_name,
        floor_name
      ].reject { |c| c.empty? }.join(" ")
    end
  end

  def realty_type(name)
    Realty::TYPES.key(name) || 5
  end

  def balcony_value(data)
    data == "есть" ? true : false
  end

  def layout_value(data)
    case data
    when "Смежно-изол." then "Смежно-изолированная"
    else data.to_s
    end
  end
end
