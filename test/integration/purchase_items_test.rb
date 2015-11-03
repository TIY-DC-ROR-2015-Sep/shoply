require 'test_helper'

class PurchaseItemsTest < ActionDispatch::IntegrationTest
  test "buying two items by category" do
    cat = Category.create! name: "Floppy Disks"
    Category.create! name: "Non-Floppy Disks"

    4.times do
      cat.products << make_product
    end

    # Sign in
    user = User.create! email: "james@example.com", password: "password"
    sign_in user

    # Click on a category
    click_on "Floppy Disks"

    # within "#main" do
    #   css("img").count # ...
    # end

    # Click "buy" on first two results

    # See two items in cart
    # Click on cart
    # See checkout page
  end
end
