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

  def realty_price(price: nil, symbol: "₽", type: "Продажа")
    converted_price = "#{price.reverse.gsub(/...(?=.)/,'\& ').reverse} #{symbol}"
    type == "Продажа" ? converted_price : "#{converted_price} / в месяц"
  end

  def realty_footer(specifications)
    result = { rooms: "", square: "", floor: "" }
    col_data = specifications.values.select { |data| ["Комнатность", "Общая площадь", "Этаж / Этажность"].include?(data["field"]) }
    col_data.each do |data|
      case data["field"]
      when "Комнатность" then result[:rooms] = data["value"].gsub(/[^0-9]/, '')
      when "Общая площадь" then result[:square] = data["value"]
      when "Этаж / Этажность" then result[:floor] = data["value"].split(" из ").join("/")
      else nil
      end
    end
    result
  end
end
