class AdminController < ApplicationController
  layout 'admin'

  def manage_products
    products = @Product.all
  end

  def prod
  end
end
