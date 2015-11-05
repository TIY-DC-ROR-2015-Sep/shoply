class AddPaymentToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :payment_id, :string
    add_column :purchases, :paid_at, :datetime
  end
end
