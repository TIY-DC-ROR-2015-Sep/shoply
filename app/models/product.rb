class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price_in_cents, presence: true, numericality: { greater_than: 0 }

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :product_purchases
  has_many :purchases, through: :product_purchases
end
