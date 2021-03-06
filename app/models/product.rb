class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price_in_cents, presence: true, numericality: { greater_than: 0 }

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :product_purchases
  has_many :purchases, through: :product_purchases

  paginates_per 25

  include PgSearch
  pg_search_scope :search_by_description, against: :description
  pg_search_scope :search_all, against: [:name, :description]

  def self.search term
    self.where("description LIKE ?", "%#{term}%")
  end
end
