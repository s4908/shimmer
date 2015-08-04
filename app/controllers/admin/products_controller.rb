class Admin::ProductsController < ApplicationController
  layout 'admin'

  def index
    @products = Product.all
  end

  def show
    set_product
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    Product.transaction do
      if @product.save
        save_image
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.' 
      else
        render :new, alert: '新增商品失敗' 
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_url, notice: 'Product was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url, notice: 'Product was successfully destroyed.'
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