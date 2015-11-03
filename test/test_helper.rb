ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara/rails'
require 'pry'
require 'faker'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def sign_in user
    visit "/users/sign_in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Log in"
  end

  def make_product
    Product.create!(
      name: Faker::Commerce.product_name,
      price_in_cents: rand(1 .. 1000)
    )
  end
end
