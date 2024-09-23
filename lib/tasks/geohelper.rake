namespace :geohelper do
  desc "Импорт объектов недвижимости"
  task fill: :environment do
    puts "Начало"

    api_key = ENV["GEOHELPER_API_KEY"]
    response = HTTParty.get(
      "http://geohelper.info/api/v1/countries?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5Bname%5D=Russia"
    ).parsed_response

    if response["success"]
      country_data = response["result"][0]

      @country = Country.find_by(name: country_data["name"])
      unless @country
        params = {
          name: country_data["name"],
          localized_name: country_data["localizedNames"]["en"],
          currency_code: country_data["currencyCode"],
          currency_symbol: "&#8381;"
        }

        country = Country.create(params)
        puts "Страна #{country.name} добавлена"
      end

      response_regions = HTTParty.get(
        "http://geohelper.info/api/v1/regions?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5BcountryIso%5D=#{country_data['iso']}&pagination%5Blimit%5D=100"
      )

      response_regions["result"].each do |region_data|
        type = region_data["localityType"]["name"] == "Чувашия" ? "республика" : region_data["localityType"]["name"]
        type_short = if region_data["localityType"].key?("localizedNamesShort")
                       region_data["localityType"]["localizedNamesShort"]["ru"]
                     else
                       region_data["localityType"]["name"] == "Чувашия" ? "респ." : region_data["localityType"]["name"].downcase
                     end

        region_params = {
          name: region_data["localizedNames"]["ru"],
          full_name: region_data["name"] == "Кемеровская область - Кузбасс область" ? "Кемеровская область - Кузбасс" : region_data["name"],
          localized_name: type.downcase,
          localized_name_short: type_short,
          country_id: @country.id
        }

        @region = Region.find_by(name: region_params[:name])
        unless @region
          region = Region.create(region_params)
          puts "Регион #{region.full_name} добавлен"
        end

        # response_cities = HTTParty.get(
        #   "http://geohelper.info/api/v1/cities?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5BregionId%5D=#{region_data["id"]}&pagination%5Blimit%5D=100"
        # )
        #
        # (1..response_cities["pagination"]["totalPageCount"]).each do |page|
        #   cities = HTTParty.get(
        #     "http://geohelper.info/api/v1/cities?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5BregionId%5D=#{region_data["id"]}&pagination%5Blimit%5D=100&pagination%5Bpage%5D=#{page}"
        #   )
        #
        #   cities["result"].each do |city_data|
        #     if city_data["localityType"].nil?
        #       city_name_array = city_data["name"].split(" ")
        #       name = city_name_array.shift
        #
        #       if city_name_array.size == 1 || city_name_array.size.zero?
        #         name = city_data["name"]
        #         full_name = city_data["name"]
        #         localized_name = ""
        #         localized_name_short = ""
        #       else
        #         localized_name = city_name_array.join(" ")
        #         localized_name_short = "#{city_name_array[0][0]}.#{city_name_array[1][0]}."
        #         full_name = [city_data["name"], localized_name].join(' ')
        #       end
        #
        #       city_params = {
        #         name: name,
        #         full_name: full_name,
        #         localized_name: localized_name,
        #         localized_name_short: localized_name_short,
        #         region_id: @region.id
        #       }
        #     else
        #       localized_name = city_data["localityType"]["name"].downcase
        #       city_type_short = if city_data["localityType"].key?("localizedNamesShort") && city_data["localityType"]["localizedNamesShort"].present?
        #                           city_data["localityType"]["localizedNamesShort"]["ru"]
        #                         else
        #                           city_data["localityType"]["name"].downcase
        #                         end
        #       full_name = [city_data["name"], localized_name].join(' ')
        #
        #       city_params = {
        #         name: city_data["localizedNames"]["ru"],
        #         full_name: full_name,
        #         localized_name: localized_name,
        #         localized_name_short: city_type_short,
        #         region_id: @region.id
        #       }
        #     end
        #
        #     @city = City.find_by(name: city_params[:name], region_id: @region.id)
        #     unless @city
        #       city = City.create(city_params)
        #       puts "Территориальный объект '#{city.full_name}' добавлен"
        #     end
        #
        #     response_streets = HTTParty.get(
        #       "http://geohelper.info/api/v1/streets?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5BcityId%5D=#{city_data["id"]}&pagination%5Blimit%5D=100"
        #     )
        #
        #     (1..response_streets["pagination"]["totalPageCount"]).each do |street_page|
        #       streets = HTTParty.get(
        #         "http://geohelper.info/api/v1/streets?apiKey=#{api_key}&locale%5Blang%5D=ru&filter%5BcityId%5D=#{city_data["id"]}&pagination%5Blimit%5D=100&pagination%5Bpage%5D=#{street_page}"
        #       )
        #
        #       streets["result"].each do |street_data|
        #         street_localized_name_short = if street_data["localityType"].key?("localizedNamesShort")
        #                                         street_data["localityType"]["localizedNamesShort"]["ru"]
        #                                       else
        #                                         street_data["localityType"]["name"]
        #                                       end
        #         street_localized_name = street_data["localityType"]["name"]
        #         street_full_name = [street_data["name"], street_localized_name].join(" ")
        #
        #         street_params = {
        #           name: street_data["name"],
        #           complete_name: street_full_name,
        #           localized_name: street_localized_name,
        #           localized_name_short: street_localized_name_short,
        #           city_id: @city.id
        #         }
        #
        #         @street = Street.find_by(name: street_params[:name], city_id: @city.id)
        #         unless @street
        #           street = Street.create(street_params)
        #           puts "Территориальный адрес '#{street.complete_name}' добавлен"
        #         end
        #       end
        #     end
        #   end
        # end
      end
      puts "Завершено!"
    else
      response["error"]["details"].each do |message|
        puts "Error: #{message}"
      end
    end
  end
end
