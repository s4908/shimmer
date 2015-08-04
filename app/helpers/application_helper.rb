module ApplicationHelper
  def current_link_class(path)
    raw 'class="active"' if current_page? path
  end


  def render_notice_alert
    raw %{<div class="alert alert-info"> #{flash[:notice]}</div>} unless flash[:notice].nil?
  end

  def render_alert_alert
    raw %{<div class="alert alert-warning"> #{flash[:alert]}</div>} unless flash[:alert].nil?
  end

  def render_error_alert
    raw %{<div class="alert alert-danger"> #{flash[:error]}</div>} unless flash[:error].nil?
  end
  
end
