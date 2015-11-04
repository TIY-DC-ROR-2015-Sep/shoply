module Api
  class CategoriesController < BaseController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find params[:id]
    end
  end
end
