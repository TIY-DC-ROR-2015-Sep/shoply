class Purchase < ActiveRecord::Base
  belongs_to :user

  has_many :product_purchases
  has_many :products, through: :product_purchases
end
