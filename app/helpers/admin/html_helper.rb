module Admin::HtmlHelper
  include Rails.application.routes.url_helpers

  def list_employees(list)
    employee_names = list.map(&:whole_name)

    content_tag(:ul, class: "list-none") do
      employee_names.map do |name|
        content_tag(:li, name, class: "list-item")
      end.reduce(&:+)
    end
  end

  def list_objects(list, action = "show")
    if action == "show"
      content_tag(:ul, class: "list-none") do
        list.map do |name|
          content_tag(:li, name, class: "list-item")
        end.reduce(&:+)
      end
    else
      content_tag(:div, list.join(" | "), class: "list-positions")
    end
  end

  def activity_status(status, only_value = false)
    if only_value
      return status ? "Активен" : "Не активен"
    end

    data = status ? { class: "bi-check-circle-fill", title: "Активен" } : { class: "bi-x-circle-fill", title: "Не активен" }
    content_tag(:i, nil, class: "bi #{data[:class]}", title: data[:title])
  end

  def review_status(value, only_value = false)
    value = value.to_sym

    return Review::STATUSES[value] if only_value

    data = case value
           when :new then { class: "bi-info-circle-fill", title: Review::STATUSES[value] }
           when :published then { class: "bi-check-circle-fill", title: Review::STATUSES[value] }
           when :rejected then { class: "bi-x-circle-fill", title: Review::STATUSES[value] }
           else nil
           end

    content_tag(:i, nil, class: "bi #{data[:class]}", title: data[:title])
  end

  def date_format(date, public = false)
    public ? l(@vacancy.published_at, format: "%e %b %Y, %H:%M") : date&.strftime("%d.%m.%Y %H:%M:%S")
  end

  def rating_with_reviews(team_member)
    reviews = team_member.reviews.published
    "#{team_member.rating} (#{reviews.size} #{Russian.p(reviews.size, "отзыв", "отзыва", "отзывов")})"
  end

  def income(vacancy)
    income_from = format_price(vacancy.income_from) if vacancy.income_from.present?
    income_to = format_price(vacancy.income_to) if vacancy.income_to.present?

    if income_from.present? && income_to.present?
      amounts = [income_from, income_to].join(" - ")
      [amounts, "₽" , vacancy.income_type].join(" ") # 40 000 – 80 000 ₽ на руки
    elsif income_from.present? && !income_to.present?
      ["от", income_from, "₽", vacancy.income_type].join(" ") # от 60 000 ₽ на руки
    else
      ["до", income_to, "₽", vacancy.income_type].join(" ") # до 60 000 ₽ на руки
    end
  end

  def format_price(price, symbol = "")
    "#{price.reverse.gsub(/...(?=.)/,'\& ').reverse} #{symbol}"
  end

  def schedule_html(data)
    content_tag(:ul, class: "list-none") do
      data.map do |key, hash|
        str = hash["start"] + hash["end"]
        hours = str.present? ? [hash["start"], hash["end"]] : ""
        content_tag(:li, class: "list-item") do
          hours = hours.empty? ? "Выходной" : hours.join(" - ")

          content_tag(:span, I18n.t("weekday.#{data[key]['day'].to_s}"), class: "list-item d-flex justify-content-end") +
          content_tag(:span, hours, class: "list-item d-flex justify-content-center")
        end
      end.reduce(&:+)
    end
  end

  def specifications(data)

  end

  def sort_work_schedule(object)
    object.work_schedule.sort_by { |_, value| value["position"].to_i }.to_h
  end

  def placeholder_work_schedule(day)
    time_start = %w[monday tuesday wednesday thursday friday].include?(day) ? t("placeholders.weekday_time_start") : t("placeholders.#{day}_time_start")
    time_end = %w[monday tuesday wednesday thursday friday].include?(day) ? t("placeholders.weekday_time_end") : t("placeholders.#{day}_time_end")

    { "start" => time_start, "end" => time_end }
  end

  def payment_data(value, type)
    return value if type == "Аренда"
    [format_price(value, "₽"), "м²"].join(" / ") # 110 345 /м²
  end

  def price_data(value, type)
    value = format_price(value, "₽")
    return value if type == "Продажа"
    [value, "в месяц"].join(" / ")
  end

  def realty_list(data)
    data.map do |id, name|
      content_tag(:div, class: "realty-list") do
        content_tag(:a, name, href: admin_realty_path(id), target: "_blank", class: "realty-item")
      end
    end.reduce(&:+)
  end
end
