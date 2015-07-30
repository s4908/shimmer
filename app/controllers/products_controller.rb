class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create, :new]
  before_action :is_admin?, only: [:edit, :update, :destroy, :create, :new]
  
  
  def index
    @products = Product.all.order('id desc')
  end

  def show
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
    @product.category_id = params[:category_id]
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    Product.transaction do
      if @product.save
        save_image
        redirect_to @product, notice: 'Product was successfully created.' 
      else
        render :new, alert: '新增商品失敗' 
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'

      else
        render :edit
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end

    def save_image
      # Save product main image
      main_image = params[:product_attachments][:main_image]
      @product_attachment = @product.product_attachments.create(:image => main_image, :image_type => 'main',:product_id => @product.id)

      # Save product other images
      if !params[:product_attachments][:other_images].blank?
        params[:product_attachments][:other_images].each do |a|
          @product_attachment = @product.product_attachments.create(:image => a, :image_type => 'other', :product_id => @product.id)
        end
      end
    end

end
