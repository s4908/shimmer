class OrdersController < ApplicationController
  STATUS = {placed: "訂單成立", shipping: "運送中", close: "關閉"}
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def show
    @order = current_order
  end

  def fill_in_information
    authenticate_user!
    @order = current_order
  end

  def checkout
    order = current_order
    order.update(order_params)
    order.status = STATUS[:placed]

    if order.save!
      reset_order!
      redirect_to action: :confirmed
    else
      render action: :fill_in_information
    end
  end


  def confirmed

  end

  private
    def set_order
      @order = current_order
    end

    def order_params
      params.require(:order).permit!
    end
end
