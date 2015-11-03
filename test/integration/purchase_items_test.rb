require 'test_helper'

class PurchaseItemsTest < ActionDispatch::IntegrationTest
  test "buying two items by category" do
    # Sign in
    user = User.create! email: "james@example.com", password: "password"
    sign_in user

    # Click on a category
    click_on "Floppy Disks"

    # Click "buy" on first two results
    # See two items in cart
    # Click on cart
    # See checkout page
  end
end
