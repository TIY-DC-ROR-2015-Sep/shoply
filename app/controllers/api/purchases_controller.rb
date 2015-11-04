class Api::PurchasesController < Api::BaseController
  def index
    @purchases = current_user.purchases
    render json: { user: current_user, purchases: @purchases }
  end

  def send_reminder
    # Send an email to user w/ details about purchase
    p = current_user.purchases.find params[:id]
    UserMailer.purchase_reminder(p).deliver_later
    head :ok
  end
end
