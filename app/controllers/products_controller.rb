class ProductsController < ApplicationController
  def main
    @categories = Category.all
  end

  def index
    @category = Category.find params[:category_id]
    @products = @category.products.page(params[:page])
  end
end
