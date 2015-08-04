class Admin::OrdersController < ApplicationController
  layout 'admin'
  def index
    @orders = Order.confirmed_orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
