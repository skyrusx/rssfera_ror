require "csv"
require "open-uri"
require "json"

namespace :crm do
  desc "Получение объектов недвижимости из CRM"
  task integration: :environment do
    include AdminHelper
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    puts "Начало"

    Realty.all.each { |realty| realty.photos.purge }
    Realty.delete_all
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE realties RESTART IDENTITY")

    token_bearer = "Bearer #{ENV["TOKEN_BEARER"]}"
    headers = { "Authorization" => token_bearer }
    realties = { apartments: [], selection: [] }

    %w[apartments selection].each do |type|
      response = HTTParty.get("https://crm.rssfera.ru/api/#{type}", headers: headers)
      @headers = response.headers

      realties[type.to_sym] += response.parsed_response
      total_pages = @headers["x-pagination-page-count"][0].to_i
      next if total_pages < 2

      (2..@headers["x-pagination-page-count"][0].to_i).each do |subindex|
        response_page = HTTParty.get("https://crm.rssfera.ru/api/#{type}", headers: { "Authorization" => token_bearer, "x-pagination-total-current-page" => subindex.to_s })
        realties[type.to_sym] += response_page.parsed_response
      end
    end

    if realties[:apartments].present?
      puts "Продажа/аренда"
      realties[:apartments].each do |realty|
        @apartment = Realty.new(realty_params(realty, "apartments"))
        if @apartment.save
          if realty["images"].present?
            image_names = realty["images"].split(",")
            image_names.each do |image_name|
              image_path = "https://crm.rssfera.ru/img/apartaments/#{image_name}.jpg"
              @apartment.photos.attach(
                io: File.open(URI.parse(image_path).open),
                filename: "realty-#{image_path.split("/").last}"
              )
            end
          end
          puts "Добавлена недвижимость: #{@apartment.name}"
        else
          puts @apartment.errors.to_a
        end
        puts ""
      end
    end

    if realties[:selection].present?
      puts "Покупка"
      realties[:selection].each do |realty|
        @selection = Realty.new(realty_params(realty, "selection"))
        if @selection.save
          puts "Добавлена недвижимость: #{@selection.name}"
        else
          puts @selection.errors.to_a
        end
        puts ""
      end
    end

    puts "Завершено!"
  end

  def realty_name(category, rooms, type, square, floor_data)
    category = category.to_s.downcase

    category_name = case category
                    when "продажа" then "Продается"
                    when "аренда" then "Сдается"
                    when "сопровождение" then "Сопровождение"
                    else "Покупка"
                    end

    rooms = rooms.to_i
    room_name = rooms.zero? ? "" : "#{rooms}-комн."

    type_short = case type
                 when "1" then "кв."
                 when "2" then "комната"
                 when "5" then "дом"
                 when "7" then "ком.недв."
                 end

    square_name = [square, "м²"].join(" ") if square.present?

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
        category_name, room_name, type_short, square_name, floor_name
      ].compact.reject { |c| c.empty? }.join(" ")
    end
  end

  def balcony_value(data)
    %w[да 1].include?(data) ? true : false
  end

  def layout_value(data)
    case data
    when "смежно-изол." then "Смежно-изолированная"
    else data.to_s.capitalize
    end
  end

  def team_member(name)
    user_name = name.split(" ")
    case user_name.size
    when 1 then TeamMember.find_by(first_name: user_name.first)
    when 2 then TeamMember.find_by(first_name: user_name.first) || TeamMember.find_by(last_name: user_name.first)
    else TeamMember.find_by(first_name: user_name[1])
    end
  end

  def realty_category(name)
    return RealtyCategory.find_by(name: "Покупка").id if name.nil?
    RealtyCategory.find_by(name: name&.capitalize)&.id
  end

  def realty_type(id)
    convert = { "1" => "Квартира", "2" => "Комната", "5" => "Дом", "7" => "Коммерческая недвижимость" }

    Realty::TYPES.key(convert[id])
  end

  def realty_city(name)
    name = name.gsub("Мурманская область, г.п. ", "").gsub("г. ", "")
    City.find_by(name: name)&.id
  end

  def realty_district(city_id, data)
    filtered_data = data.reject { |_, v| v == "0" }
    return District.find_by(city_id: city_id).id unless filtered_data.present?

    district_ids = []
    filtered_data.keys.each do |key|
      district_ids << case key
                     when :len then District.find_by(city_id: city_id, name: "Ленинский").id
                     when :okt then District.find_by(city_id: city_id, name: "Октябрьский").id
                     when :per then District.find_by(city_id: city_id, name: "Первомайский").id
                     else District.find_by(city_id: city_id).id
                     end
    end

    district_ids
  end

  def realty_districts(city_id, name)
    return District.find_by(city_id: city_id).id.to_s.split unless name.present?

    District.find_by(name: name.capitalize).id.to_s.split
  end

  def realty_street(city_id, district_id, name)
    name = "Полярный круг" if name == "Полярный Круг"
    name = "Молодежная" if name == "Молодежный"

    street = Street.find_by(name: name, district_id: district_id)

    if street.nil?
      district_ids = City.find_by(id: city_id).districts.ids
      street = Street.find_by(district_id: district_ids, name: name)
    end

    if name == "Образцовая"
      street = Street.find_or_create_by({ name: "Образцовая", localized_name: "улица", localized_name_short: "ул.", full_name: "Образцовая улица", district_id: district_id })
    end
    if name == "СНТ &quot;Свой дом&quot;, участок № 178"
      street = Street.find_or_create_by({ name: "Свой дом", localized_name: "садоводческое некоммерческое товарищество", localized_name_short: "снт", full_name: "СНТ Свой дом", district_id: district_id })
    end
    if name == "Автогородок 53 А 2 очередь"
      street = Street.find_or_create_by({ name: "Автогородок", localized_name: "автогородок", localized_name_short: "авто г-к", full_name: "СНТ Свой дом", district_id: district_id })
    end

    street.id
  end

  def realty_payments(object, type)
    return "" unless type&.capitalize == "Продажа"

    result = object["price"].to_f / object["total_area"].to_f
    price = number_to_currency(result, unit: "₽", strip_insignificant_zeros: true)
    [price, "м²"].join(" / ")
  end

  def realty_params(realty, type)
    realty_title = realty_name(
      realty["deal"],
      realty["room"],
      realty["object"],
      realty["total_area"],
      [realty["floor"], realty["number_floor"]]
    )

    city_id = realty_city(realty["city"])
    if type == "selection"
      payments = ""
      district_ids = realty_district(
        city_id,
        { len: realty["district_len"], okt: realty["district_okt"], per: realty["district_per"] }
      )
      street_id = ""
      house = ""
      flat = ""
    else
      payments = realty_payments(realty, realty["deal"])
      district_ids = realty_districts(city_id, realty["district"])
      street_id = realty_street(city_id, district_ids, realty["street"])
      house = realty["building"]
      flat = realty["apartment"]
    end

    {
      name: realty_title,
      status: true,
      payments: payments,
      description: realty["comment"].gsub("&lt;", "<").gsub("&gt;", ">").html_safe,
      team_member_id: team_member(realty["agent_name"])&.id,
      realty_category_id: realty_category(realty["deal"]),
      created_at: realty["date"].in_time_zone('Moscow'),
      updated_at: DateTime.current.in_time_zone('Moscow'),
      type_object: realty_type(realty["object"]),
      city_id: city_id,
      district_ids: district_ids,
      street_id: street_id,
      total_area: realty["total_area"].to_f,
      living_area: realty["floor_area"].to_f,
      kitchen_area: realty["kitchen_area"].to_f,
      floor: realty["floor"].to_i,
      floors: realty["number_floor"].to_i,
      number_rooms: realty["room"].to_i,
      layout: layout_value(realty["type"]),
      house: house,
      flat: flat,
      price: realty["price"].to_f,
      balcony: balcony_value(realty["balcony"]),
      crm_id: realty["id"].to_i
    }
  end
end
