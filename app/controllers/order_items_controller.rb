class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_items_params)
    @order_item.price = Product.find(product_id).price
    @order.save
    session[:order_id] = @order.id
    flash[:notice] = "成功將商品加入購物籃"
    redirect_to product_path(product_id)
  end

  def destroy
    order = current_order
    order.order_items.find(params[:id]).destroy
    redirect_to orders_path
  end

private
  def order_items_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def product_id
    params[:order_item][:product_id]
  end
end
