class Api::PurchasesController < Api::BaseController
  def index
    @purchases = current_user.purchases
    render json: { user: current_user, purchases: @purchases }
  end
end
