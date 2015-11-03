module ApplicationHelper
  def display_price product
    number_to_currency(product.price_in_cents / 100.0)
  end
end
