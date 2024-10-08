module Application::HtmlHelper
  include Rails.application.routes.url_helpers

  def link_phone(value)
    content_tag(:a, value, href: "tel:#{value.gsub(/[-() "]/, '')}")
  end

  def link_call(value)
    content_tag(:a, href: "tel:#{value.gsub(/[-() "]/, '')}", class: "btn btn-success") do
      content_tag(:i, '', class: "bi bi-telephone-fill").html_safe + " Позвонить"
    end
  end

  def link_whatsapp(value)
    content_tag(:a, href: "https://wa.me/#{value.gsub(/[-() "]/, '')}", class: "btn btn-secondary") do
      content_tag(:i, '', class: "bi bi-whatsapp").html_safe + " WhatsApp"
    end
  end

  def link_email(value)
    content_tag(:a, value, href: "mailto:#{value}")
  end

  def list_positions(names)
    content_tag(:ul, class: "skills") do
      names.pluck(:position, :name).map do |position, name|
        content_tag :li do
          if position == 1
            name.html_safe + ' ' + content_tag(:i, '', class: "bi bi-star-fill")
          else
            name
          end
        end
      end.reduce(&:+)
    end
  end

  def list_positions_detail(names, company = "АН РиелтСтройСфера")
    names.join(" | ").html_safe + " в " + content_tag(:span, company)
  end

  def accordion_button_name(positions)
    job_titles = positions.join(",").downcase
    job_titles.include?("руководитель") ? "О руководителе" : "О сотруднике"
  end

  def accordion_button(title, count)
    [title, "(#{count})"].join(" ")
  end

  def rating_stars(rating)
    rating = rating.to_s.split(".")
    stars = { fill: 0, half: 0, empty: 0 }
    stars[:fill] = rating[0].to_i
    stars[:half] = rating[1].to_i.zero? ? 0 : 1
    stars[:empty] = 5 - stars[:fill] - stars[:half]

    stars.delete_if { |_, v| v.zero? }
  end

  def rating_reviews(team_member)
    reviews = team_member.reviews.published
    content_tag(:span, class: "rating-review") do
      "#{team_member.rating} (#{reviews.size} #{Russian.p(reviews.size, "отзыв", "отзыва", "отзывов")})"
    end
  end

  def rating_review(team_member)
    rating = team_member.rating
    reviews = team_member.reviews.published

    content_tag(:p, class: "rating-review") do
      content_tag(:span, rating).html_safe + "(#{reviews.size} #{Russian.p(reviews.size, "отзыв", "отзыва", "отзывов")})"
    end
  end

  def tab_name(text = "Все объекты", count)
    "#{text} (#{count})"
  end

  def realty_location(object)
    city = [object.city.localized_name_short, object.city.name].join(" ")
    street = [object.street.localized_name_short, object.street.name].join(" ") if object.street.present?
    house = object.house if object.house.present?
    [city, street, house].compact.join(", ")
  end

  def realty_footer(object)
    content_tag(:div, class: "card-footer text-body-secondary") do
      floors = [object.floor, object.floors].join("/")
      square = "#{object.total_area.to_s.sub(/\.0+$/, '')} м²"

      [object.number_rooms, square, floors].map.with_index(1) do |data, index|
        html_data = case index
                    when 1 then { class: "num-rooms", title: "Комнаты" }
                    when 2 then { class: "square", title: "Площадь" }
                    else { class: "floor-info", title: "Этаж" }
                    end

        content_tag(:div, class: html_data[:class]) do
          content_tag(:span, "#{html_data[:title]}:") + " #{data}"
        end
      end.reduce(&:+)
    end
  end

  def vacancy_info(vacancy)
    items = []

    items << { icon: "bi bi-person-check-fill", name: "Тип занятости:", value: vacancy.employment_types.pluck(:name) } if vacancy.employment_types
    items << { icon: "bi bi-geo-alt-fill", name: "Местоположение:", value: vacancy.location } if vacancy.location
    items << { icon: "bi bi-person-lines-fill", name: "Должность:", value: vacancy.job_title.name } if vacancy.job_title
    items << { icon: "bi bi-luggage-fill", name: "Опыт работы:", value: vacancy.experience } if vacancy.experience
    items << { icon: "bi bi-cash-coin", name: "Уровень дохода:", value: income(vacancy) }
    items << { icon: "bi bi-clock-fill", name: "Дата публикации:", value: date_format(vacancy.published_at, true) } if vacancy.published_at

    content_tag(:ul, class: "list-none") do
      items.map do |item|
        values = if item[:value].kind_of?(Array)
                   item[:value].map do |value|
                     content_tag(:span, value)
                   end.reduce(&:+)
                 else
                   content_tag(:span, item[:value])
                 end

        content_tag(:li, class: "items-center mb-3") do
          content_tag(:i, '', class: item[:icon]).html_safe + content_tag(:div, class: "item-info") do
            content_tag(:p, item[:name]) + values
          end
        end
      end.reduce(&:+)
    end
  end

  def vacancy_skills(vacancy)
    content_tag(:div, class: "list-skills") do
      vacancy.skills.pluck(:name).map do |skill|
        content_tag(:div, skill, class: "skill-item")
      end.reduce(&:+)
    end
  end

  def unread_messages
    counter = Message.unread.size
    return if counter.zero?

    content_tag(:span, class: "position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger") do
      counter.to_s.html_safe + content_tag(:span, "Непрочитанные сообщения", class: "visually-hidden")
    end
  end

  def realty_price(object)
    price = number_to_currency(object.price, unit: "₽", strip_insignificant_zeros: true)
    return price unless object.realty_category.slug == "rent"

    [price, "в месяц"].join(" / ")
  end

  def link_to_realty(object)
    href = object.realty_category.slug == "rent" ? rents_realty_path(object.slug) : buys_realty_path(object.slug)
    link_to(object.name, href)
  end

  def realty_href(object)
    object.realty_category.slug == "rent" ? rents_realty_path(object.slug) : buys_realty_path(object.slug)
  end

  def realty_square(value)
    [value.to_s.sub(/\.0+$/, ''), "м²"].join(" ")
  end

  def available_value(value)
    value ? "Есть" : "Нет"
  end
end
