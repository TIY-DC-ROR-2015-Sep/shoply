class ProductsController < ApplicationController
  def main
    @categories = Category.all
  end
end
