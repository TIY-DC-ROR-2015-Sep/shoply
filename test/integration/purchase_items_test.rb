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
    assert_equal 3, find_all(".container .item").count

    # Click "buy" on first two results
    first(:button, "Buy").click
    find_all(:button, "Buy")[1].click

    # See two items in cart
    # left_nav = find(".navbar-nav.pull-right")
    # assert left_nav.has_content?("2 items in cart")

    # Click on cart
    click_link "2 items in cart"

    # See checkout page
    skip
  end
end
