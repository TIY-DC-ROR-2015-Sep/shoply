class PurchasesController < ApplicationController
  # TODO: what about not-logged-in users?
  def new
    @items = cart.items
  end

  def create
    purchase = current_user.purchases.create!
    params[:item_ids].zip(params[:quantities]).each do |item_id, quantity|
      p = Product.find item_id
      purchase.product_purchases.create! product: p, quantity: quantity
    end
    cart.clear
    redirect_to purchase, notice: "Invoice created. Pay when ready."
  end

  def index
    @purchases = current_user.purchases
  end

  def show
    @purchase = current_user.purchases.find params[:id]
  end

  def pay
    purchase = Purchase.find params[:id]
    c = Stripe::Charge.create(
      amount: purchase.total_cost_in_cents,
      currency: "usd",
      source: params[:stripeToken],
      description: "Charge for Shoply purchase ##{purchase.id}"
    )
    flash[:success] = "Payment received"
    purchase.update! paid_at: Time.now, payment_id: c.id
    redirect_to purchase
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end
end
