module ApplicationHelper
  include Application::HtmlHelper

  def footer_data
    { contacts: Contact.last, social_links: SocialLink.active }
  end

  def meta_data
    Setting.find_by(page: controller_name)
  end

  def link_active_class(link_path)
    page_fullpath = request.fullpath
    if params[:slug].present?
      page_fullpath.gsub!("/#{params[:slug]}", "")
    end
    page_fullpath == link_path ? "nav-item active" : "nav-item"
  end

  def pagination(collection, anchor)
    params = { anchor: anchor }
    will_paginate(
      collection,
      params: params,
      renderer: WillPaginate::ActionView::BootstrapLinkRenderer,
      previous_label: "&laquo;",
      next_label: "&raquo;"
    )
  end

  def build_alert_classes(alert_type)
    classes = 'alert alert-dismissable '
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
      classes += 'alert-danger'
    when :warning, :todo
      classes += 'alert-warning'
    when :notice, :success
      classes += 'alert-success'
    else
      classes += 'alert-info'
    end

    classes
  end

  def form_title(category, page, part = nil)
    title = [
              Message::CATEGORIES[category.to_sym],
              Message::PAGE_TITLES[page.to_sym]
            ].join(" ")

    title += " #{part}" if part
    title
  end

  def working_hours(work_schedule)
    result = {}

    work_schedule.values.group_by { |v| v["start"] }.each.with_index do |(_, values), index|
      start_time = values.first["start"]
      end_time = values.last["end"]

      first_day = t("weekday.#{values.first['day'].to_s}")
      last_day = t("weekday.#{values.last['day'].to_s}")

      times = (start_time.empty? && end_time.empty?) ? "выходной" : [start_time, end_time].join(" - ")
      days = values.size == 1 ? first_day : [first_day, last_day].join(" - ")

      result[index] = { times: times, days: days}
    end

    result
  end
end
