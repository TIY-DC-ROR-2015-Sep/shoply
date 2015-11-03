class CreateProductPurchases < ActiveRecord::Migration
  def change
    create_table :product_purchases do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :purchase, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
