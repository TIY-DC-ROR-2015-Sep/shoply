class Api::ProductsController < Api::BaseController
  def search
    @products = Product.search params[:q]
  end
end
