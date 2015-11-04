class PurchasesController < ApplicationController
  # TODO: what about not-logged-in users?
  def new
    @items = cart.items
  end

  def create
  end
end
