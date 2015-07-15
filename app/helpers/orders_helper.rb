module OrdersHelper
  # For _progress_bar use
  def current_order_step_status(action)
    actions = {"show" => 1, "fill_in_information" => 2, "confirmed" => 3}
    return "" if params[:controller] != "orders"

    if action == params[:action]
      return "active"
    else
      if actions[action] < actions[params[:action]]
        return "complete"
      else
        return "disabled"
      end
    end
  end

end
