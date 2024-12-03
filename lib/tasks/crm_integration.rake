require "csv"
require "open-uri"
require "json"

namespace :crm do
  desc "Получение объектов недвижимости из CRM"
  task integration: :environment do
    include AdminHelper
    include ApplicationHelper
    include ActionView::Helpers::NumberHelper

    CITIES_BY_REGION = {
      "Мурманск" => "Мурманская область",
      "Кола" => "Мурманская область",
      "Мурмаши" => "Мурманская область",
      "Кильдинстрой" => "Мурманская область",
      "Североморск" => "Мурманская область",
      "Междуречье" => "Мурманская область",
    }.freeze

    DADATA = {
      api_key: ENV["DADATA_API_KEY"],
      secret_key: ENV["DADATA_SECRET_KEY"]
    }.freeze

    puts "Начало"

    # Realty.all.each { |realty| realty.photos.purge }
    # Realty.delete_all
    # ActiveRecord::Base.connection.execute("TRUNCATE TABLE realties RESTART IDENTITY")
    # RealtyDistrictJoin.delete_all
    # ActiveRecord::Base.connection.execute("TRUNCATE TABLE realty_district_joins RESTART IDENTITY")

    token_bearer = "Bearer #{ENV["TOKEN_BEARER"]}"
    headers = { "Authorization" => token_bearer }
    realties = { apartments: [], apartments_rent: [], selection: [], selection_rent: [] }

    %w[apartments apartments_rent selection selection_rent].each do |type|
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
      puts "Продажа"

      apartments_crm_ids = RealtyCategory.find_by_name("Продажа").realties.pluck(:crm_id)
      realties[:apartments].each do |realty|
        next if apartments_crm_ids.include?(realty["id"].to_i)
        next if realty["deal"].capitalize == "Сопровождение"

        @apartment = Realty.new(realty_params(realty, "apartments"))
        if @apartment.save
          if realty["images"].present?
            image_names = realty["images"].split(",")
            image_names.each do |image_name|
              image_path = "https://crm.rssfera.ru/img/apartaments/#{image_name}.jpg"
              begin
                attach_io = URI.parse(image_path).open
                @apartment.photos.attach(
                  io: File.open(attach_io),
                  filename: "realty-#{image_path.split("/").last}"
                )
              rescue OpenURI::HTTPError => e
                puts e
              end
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

    if realties[:apartments_rent].present?
      puts "Аренда"

      apartments_rent_crm_ids = RealtyCategory.find_by_name("Аренда").realties.pluck(:crm_id)
      realties[:apartments_rent].each do |realty|
        next if apartments_rent_crm_ids.include?(realty["id"].to_i)

        @apartment_rent = Realty.new(realty_params(realty, "apartments_rent"))
        if @apartment_rent.save
          if realty["images"].present?
            image_names = realty["images"].split(",")
            image_names.each do |image_name|
              image_path = "https://crm.rssfera.ru/img/apartaments/#{image_name}.jpg"
              begin
                attach_io = URI.parse(image_path).open
                @apartment_rent.photos.attach(
                  io: File.open(attach_io),
                  filename: "realty-#{image_path.split("/").last}"
                )
              rescue OpenURI::HTTPError => e
                puts e
              end
            end
          end
          puts "Добавлена недвижимость: #{@apartment_rent.name}"
        else
          puts @apartment_rent.errors.to_a
        end
        puts ""
      end
    end

    if realties[:selection].present?
      puts "Покупка"

      selection_crm_ids = RealtyCategory.find_by_name("Покупка").realties.pluck(:crm_id)
      realties[:selection].each do |realty|
        next if selection_crm_ids.include?(realty["id"].to_i)

        @selection = Realty.new(realty_params(realty, "selection"))
        if @selection.save
          puts "Добавлена недвижимость: #{@selection.name}"
        else
          puts @selection.errors.to_a
        end
        puts ""
      end
    end

    if realties[:selection_rent].present?
      puts "Аренда (поиск)"

      selection_rent_crm_ids = RealtyCategory.find_by_name("Аренда (поиск)").realties.pluck(:crm_id)
      realties[:selection_rent].each do |realty|
        next if selection_rent_crm_ids.include?(realty["id"].to_i)

        @selection_rent = Realty.new(realty_params(realty, "selection_rent"))
        if @selection_rent.save
          puts "Добавлена недвижимость: #{@selection_rent.name}"
        else
          puts @selection_rent.errors.to_a
        end
        puts ""
      end
    end

    puts "Завершено!"
  end

  def realty_params(realty, type)
    realty_title = realty_name(
      type,
      realty["deal"],
      realty["room"],
      realty["object"],
      realty["total_area"],
      [realty["floor"], realty["number_floor"]]
    )

    dadata = dadata_response(realty)
    if realty["city"] == "Мурманская область, г.п. Кола"
      dadata_add = dadata_response(realty, true)
    end

    city_id = realty_city(realty["city"], dadata)
    district_id = realty_district(city_id, realty, dadata)
    street_id = realty_street(city_id, district_id, dadata, dadata_add)
    payments = realty_payments(realty)
    house = realty_house(realty["building"], dadata_add)
    flat = realty["apartment"]

    {
      name: realty_title,
      status: true,
      payments: payments,
      description: realty["comment"].gsub("&lt;", "<").gsub("&gt;", ">").html_safe,
      team_member_id: team_member(realty["agent_id"], realty["agent_name"])&.id,
      realty_category_id: realty_category(type),
      created_at: realty["date"].in_time_zone('Moscow'),
      updated_at: DateTime.current.in_time_zone('Moscow'),
      type_object: realty_type(realty["object"]),
      city_id: city_id,
      district_ids: district_id,
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
      crm_id: realty["id"].to_i,
      latitude: dadata["geo_lat"],
      longitude: dadata["geo_lon"]
    }
  end

  def realty_name(query_type, category, rooms, type, square, floor_data)
    category = category.to_s.downcase

    if query_type == "selection_rent"
      category_name = "Аренда (поиск)"
    elsif query_type == "apartments_rent"
      category_name = "Сдается"
    else
      category_name = case category
                      when "продажа" then "Продается"
                      when "аренда" then "Сдается"
                      when "сопровождение" then "Сопровождение"
                      else "Покупка"
                      end
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

  def dadata_response(realty, repeat = false)
    realty_city = realty["city"].gsub("Мурманская область, г.п. ", "").gsub("г. ", "").gsub("-3", "")
    realty_region = CITIES_BY_REGION[realty_city]
    address = [realty_region, realty_city, realty["street"], realty["building"]].reject { |el| el.to_s.empty? }.join(" ")
    if repeat && address == "Мурманская область Кола СНТ &quot;Свой дом&quot;, участок № 178"
      address = "Мурманская область СНТ СН Свой Дом 178"
    end

    HTTParty.post(
      "https://cleaner.dadata.ru/api/v1/clean/address",
      body: [address].to_json,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token #{DADATA[:api_key]}",
        "X-Secret": DADATA[:secret_key]
      }
    ).parsed_response.first
  end

  def realty_city(name, dadata = false)
    region_name = [dadata["region"], dadata["region_type_full"]].join(" ")
    region = Region.find_by(full_name: region_name)

    city_params = {
      name: name,
      status: true,
      localized_name: dadata["city_type_full"],
      localized_name_short: "#{dadata["city_type"]}.",
      full_name: [dadata["city"], dadata["city_type_full"]].join(" "),
      region_id: region.id
    }

    City.find_or_create_by(city_params).id
  end

  def realty_district(city_id, realty, dadata)
    if realty.key?('district_len')
      districts = { len: realty['district_len'].to_i, okt: realty['district_okt'].to_i, per: realty['district_per'].to_i }
      district_names = { len: "Ленинский", okt: "Октябрьский", per: "Первомайский" }

      if districts.keys.join.squeeze('0').count('0').zero?
        district_name = "Не указан"
        district_localized_name = "район"
        district_localized_name_short = "р-н"
        district_full_name = [district_name, "район"].join(" ")

        district_params = {
          name: district_name,
          city_id: city_id,
          localized_name: district_localized_name,
          localized_name_short: district_localized_name_short,
          full_name: district_full_name
        }

        return District.find_or_create_by(district_params).id
      else
        district_ids = []
        districts.each do |key, value|
          next if value.zero?

          district_name = district_names[key]
          district_localized_name = "район"
          district_localized_name_short = "р-н"
          district_full_name = [district_name, "район"].join(" ")

          district_params = {
            name: district_name,
            city_id: city_id,
            localized_name: district_localized_name,
            localized_name_short: district_localized_name_short,
            full_name: district_full_name
          }

          district_ids << District.find_or_create_by(district_params).id
        end

        district_ids
      end
    else
      if realty['district'].present?
        district_name = realty['district'].capitalize
        district_localized_name = "район"
        district_localized_name_short = "р-н"
        district_full_name = [district_name, "район"].join(" ")
      else
        district_name = dadata["area"]
        district_localized_name = dadata["area_type_full"]
        district_localized_name_short = dadata["area_type"]
        district_full_name = [dadata["area"], dadata["area_type_full"]].join(" ")
      end

      district_params = {
        name: district_name,
        city_id: city_id,
        localized_name: district_localized_name,
        localized_name_short: district_localized_name_short,
        full_name: district_full_name
      }

      District.find_or_create_by(district_params).id
    end
  end

  def realty_street(city_id, district_id, dadata, dadata_add)
    if dadata_add.present?
      street_name = dadata_add["settlement"]
      street_localized_name = dadata_add["settlement_type_full"]
      street_localized_name_short = dadata_add["settlement_type"]
      street_full_name = [dadata_add["settlement"], dadata_add["settlement_type_full"]].join(" ")
    else
      if dadata["street"].nil?
        street_name = "Не указана"
        street_localized_name = "улица"
        street_localized_name_short = "ул."
        street_full_name = [street_name, street_localized_name].join(" ")
      else
        street_name = dadata["street"]
        street_localized_name = dadata["street_type_full"]
        street_localized_name_short = "#{dadata["street_type"]}."
        street_full_name = [dadata["street"], dadata["street_type_full"]].join(" ")
      end
    end

    city_params = {
      name: street_name,
      localized_name: street_localized_name,
      localized_name_short: street_localized_name_short,
      full_name: street_full_name,
      district_id: district_id,
      city_id: city_id
    }

    Street.find_or_create_by(city_params).id
  end

  def realty_payments(object)
    return "" unless object["deal"]&.capitalize == "Продажа"

    result = object["price"].to_f / object["total_area"].to_f
    price = number_to_currency(result, unit: "₽", strip_insignificant_zeros: true)
    [price, "м²"].join(" / ")
  end

  def realty_house(building, dadata_add)
    if building.present?
      building
    elsif dadata_add.present?
      dadata_add["house"]
    else
      ""
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

  def team_member(id, name)
    team_member_id = TeamMember.find_by(crm_id: id)
    return team_member_id if team_member_id.present?

    user_name = name.gsub(" (аренда)", "").split(" ")
    case user_name.size
    when 1 then TeamMember.find_by(first_name: user_name.first)
    when 2 then TeamMember.find_by(first_name: user_name.first) || TeamMember.find_by(last_name: user_name.first)
    else TeamMember.find_by(first_name: user_name[1])
    end
  end

  def realty_category(type)
    case type
    when "apartments" then RealtyCategory.find_by(name: "Продажа").id
    when "apartments_rent" then RealtyCategory.find_by(name: "Аренда").id
    when "selection" then RealtyCategory.find_by(name: "Покупка").id
    when "selection_rent" then RealtyCategory.find_by(name: "Аренда (поиск)").id
    else nil
    end
  end

  def realty_type(id)
    convert = { "1" => "Квартира", "2" => "Комната", "5" => "Дом", "7" => "Коммерческая недвижимость" }

    Realty::TYPES.key(convert[id])
  end
end
