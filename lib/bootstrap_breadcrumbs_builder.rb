class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.content_tag(:ol, class: 'breadcrumb m-0') do
      elements_count = @elements.size
      i = 0
      @elements.collect do |element|
        i += 1
        render_element(element, last = (i == elements_count))
      end.join.html_safe
    end
  end

  def render_element(element, last = false)
    current = @context.current_page?(compute_path(element))

    @context.content_tag(:li, class: "breadcrumb-item #{'active' if last}") do
      if last
        link_or_text = compute_name(element)
      else
        link_or_text = @context.link_to(compute_name(element), compute_path(element), element.options)
      end
      divider = @context.content_tag(:span, (@options[:separator] || ' &gt; ').html_safe, :class => 'divider') unless current

      link_or_text + (last ? '' : '')
    end
  end
end
