class ProductPurchase < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase

  validates_presence_of :product, :purchase, :quantity
  validates_uniqueness_of :product, scope: :purchase
end
