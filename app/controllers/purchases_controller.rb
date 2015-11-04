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
end
