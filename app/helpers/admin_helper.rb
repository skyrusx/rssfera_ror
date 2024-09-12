module AdminHelper
  include Admin::HtmlHelper

  def page_title
    t params["controller"].gsub('/', '_')
  end

  def base_url(section = nil)
    return request.base_url if section.nil?
    request.base_url + "/#{section}/"
  end

  def active_class(link_path)
    action = case params[:action]
             when "show" then params[:id]
             when "edit" then [params[:id], params[:action]].join("/")
             else params[:action]
             end

    link_path = link_path.gsub("/#{params[:id]}", "") if params[:controller] == "admin/contacts"

    request.fullpath.gsub("/#{action}", "") == link_path ? "nav-link active align-middle px-0" : "nav-link align-middle px-0"
  end

  def nav_link_classes(link_path)
    current_page?(link_path) ? "nav-link active align-middle px-0" : "nav-link align-middle px-0"
  end

  def whatsapp(value)
    value ? "Да" : "Нет"
  end

  def build_toast_data(toast_type)
    case toast_type.to_sym
    when :alert, :danger, :error, :validation_errors
      {
        classes: "toast-danger",
        title: "Ошибка",
        icon: content_tag(:i, nil, class: "bi bi-exclamation-triangle-fill")
      }
    when :warning, :todo
      {
        classes: "toast-warning",
        title: "Предупреждение",
        icon: content_tag(:i, nil, class: "bi bi-exclamation-triangle-fill")
      }
    when :notice, :success
      {
        classes: "toast-success",
        title: "Уведомление",
        icon: content_tag(:i, nil, class: "bi bi-check-circle-fill")
      }
    else
      {
        classes: "toast-info",
        title: "Информация",
        icon: content_tag(:i, nil, class: "bi bi-info-circle-fill")
      }
    end
  end

  def admin_pagination(collection)
    will_paginate(
      collection, renderer: WillPaginate::ActionView::BootstrapLinkRenderer,
      previous_label: "&laquo;",
      next_label: "&raquo;"
    )
  end

  def showing_results(size, total)
    "Показано #{size} из #{total}"
  end
end
