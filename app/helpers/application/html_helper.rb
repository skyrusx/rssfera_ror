module Application::HtmlHelper
  include Rails.application.routes.url_helpers

  def link_phone(value)
    content_tag(:a, value, href: "tel:#{value.gsub(/[-() "]/, '')}")
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
end
