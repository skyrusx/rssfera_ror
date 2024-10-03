namespace :crm do
  desc "Получение объектов недвижимости из CRM"
  task integration: :environment do
    puts "Начало"

    token_bearer = "Bearer d2MUYfx6V6lkhSC4Xyf_X9L_yUeHuH5VXiZs2fug5Ackkzd5QxXeorB05QOuf0VN6hhgF5nMrqH9-CqbLiPcuRDTrbm-Z5Otk1_ZFu6-XXn-6NEkmko55ItMd9s-K6oQ"
    headers = { "Authorization" => token_bearer }
    realties = { apartments: [], selection: [] }

    %w[apartments selection].each do |type|
      response = HTTParty.get("https://crm.rssfera.ru/api/#{type}", headers: headers)
      @headers = response.headers

      realties[type.to_sym] += response.parsed_response

      (2..@headers["x-pagination-page-count"][0].to_i).each do |subindex|
        response_page = HTTParty.get("https://crm.rssfera.ru/api/#{type}", headers: { "Authorization" => token_bearer, "x-pagination-total-current-page" => subindex.to_s })
        realties[type.to_sym] += response_page.parsed_response
      end
    end

    realties.each do |type, data_array|
      data_array.each do |realty|
        p realty
        puts ""
      end
    end

    puts "Завершено!"
  end
end
