class OrdersController < ApplicationController
  STATUS = {placed: " 訂單成立", shipping: "運送中", close: "關閉"}
  attr_reader :STATUS
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def show
    @order = current_order
  end

  # POST /order
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  def checkout
    @order = current_order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_order
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end
end
