class ProductsController < ApplicationController
  def main
    @categories = Category.all
  end

  def index
    @category = Category.find params[:category_id]
    @products = @category.products.page(params[:page])
  end

  def add_to_cart
    category = Category.find params[:category_id]
    product  = category.products.find params[:product_id]
    cart.add product
    render json: { status: "added" }
  end

  def search
    @results = Product.search_all(params[:q]).page params[:page]
  end
end
