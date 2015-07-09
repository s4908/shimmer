module ApplicationHelper
  def current_link_class(path)
    raw 'class="active"' if current_page? path
  end
end
