class Purchase < ActiveRecord::Base
  belongs_to :user

  has_many :product_purchases
  has_many :products, through: :product_purchases

  def total_cost_in_cents
    product_purchases.
      includes(:product).
      map { |pp| pp.quantity * pp.product.price_in_cents }.
      reduce(:+)
  end
end
