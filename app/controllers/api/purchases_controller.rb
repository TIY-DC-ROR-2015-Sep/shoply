class Api::PurchasesController < Api::BaseController
  def index
    @purchases = current_user.purchases
  end
end
