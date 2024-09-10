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

  def form_title(category, page)
    [Message::CATEGORIES[category.to_sym], Message::PAGE_TITLES[page.to_sym]].join(" ")
  end
end
