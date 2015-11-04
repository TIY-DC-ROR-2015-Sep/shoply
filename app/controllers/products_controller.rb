class ProductsController < ApplicationController
  def main
    @categories = Category.all
  end

  def index
    @category = Category.find params[:category_id]
    @products = @category.products.page(params[:page])
  end

  def add_to_cart
    product = Product.find params[:product_id]
    cart.add product
    redirect_to :back
  end
end
